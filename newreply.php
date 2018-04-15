<?php
	// die("Disabled.");
	
	require 'lib/function.php';
	
	// Stop this insanity.  Never index newreply.
	$meta['noindex'] = true;
	
	if ($banned) {
		errorpage("Sorry, but you are banned from the board, and can not post.","thread.php?id={$_GET['id']}",$thread['title'],0);
	}
	
	$_GET['id']         = filter_int($_GET['id']);
	$_GET['postid']     = filter_int($_GET['postid']);
	
	load_thread($_GET['id']);
	check_forumban($forum['id'], $loguser['id']);
	$ismod = ismod($forum['id']);
	
	// load_thread takes care of view permissions, but the reply permissions still need to be checked
	if (!$ismod && $thread['closed']) {
		errorpage("Sorry, but this thread is closed, and no more replies can be posted in it.","thread.php?id={$_GET['id']}",$thread['title'],0);
	} else if ($loguser['powerlevel'] < $forum['minpowerreply']) {
		errorpage("You are not allowed to post in this thread.","thread.php?id={$_GET['id']}",$thread['title'],0);
	}
	
	if ($forum_error) {
		$forum_error = "<table class='table'>{$forum_error}</table>";
	}
	
	$_POST['username'] 	= filter_string($_POST['username']);
	$_POST['password'] 	= filter_string($_POST['password']);
	
	$_POST['message']	= filter_string($_POST['message']);
	
	$_POST['moodid']    = filter_int($_POST['moodid']);
	$_POST['nosmilies']	= filter_int($_POST['nosmilies']);
	$_POST['nolayout']	= filter_int($_POST['nolayout']);
	$_POST['nohtml']    = filter_int($_POST['nohtml']);
	
	$_POST['stick'] = filter_int($_POST['stick']);
	$_POST['close'] = filter_int($_POST['close']);
	$_POST['tannc'] = filter_int($_POST['tannc']);
	
	$userid = $loguser['id'];
	if (isset($_POST['submit']) || isset($_POST['preview'])) {
		$error = '';
		// Trying to post as someone else?
		if ($loguser['id'] && !$_POST['password']) {
			$user   = $loguser;
		} else {
			$userid = checkuser($_POST['username'], $_POST['password']);
			if ($userid == -1) {
				$error	= "Either you didn't enter an existing username, or you haven't entered the right password for the username.";
			} else {
				$user 	= load_user($userid);
			}
		}
		
		if (!$error) {
			if ($userid != $loguser['id']) {
				check_forumban($forum['id'], $userid);
				$ismod = ismod($forum['id'], $user);
				if ($thread['closed'] && !$ismod)
					$error	= 'The thread is closed and no more replies can be posted.';
				else if ($user['powerlevel'] < $forum['minpowerreply']) // or banned
					$error	= 'Replying in this forum is restricted, and you are not allowed to post in this forum.';
			} else {
				if (!$_POST['message'])
					$error	= "You didn't enter anything in the post.";
				else if ($user['lastposttime'] > (ctime()-4))
					$error	= "You are posting too fast.";
			}
		}
		
		if ($error) {
			errorpage("Couldn't enter the post. $error", "thread.php?id={$_GET['id']}", htmlspecialchars($thread['title']), 0);
		}
		
		// Process attachments removal
		if ($config['allow-attachments']) {
			process_temp_attachments($_GET['id'], $userid);
		}
		
		// All OK
		if (isset($_POST['submit'])) {
			check_token($_POST['auth']);
			$sql->beginTransaction();
			
			$modq = $ismod ? "`closed` = {$_POST['close']}, `sticky` = {$_POST['stick']}, announcement = {$_POST['tannc']}," : "";
			$pid = create_post($user, $forum['id'], $thread['id'], $_POST['message'], $_SERVER['REMOTE_ADDR'], $_POST['moodid'], $_POST['nosmilies'], $_POST['nolayout'], $modq);
			if ($config['allow-attachments']) {
				save_attachments($_GET['id'], $userid, $pid);
			}
			$sql->commit();
			
			xk_ircout("reply", $user['name'], array(
				'forum'		=> $forum['title'],
				'fid'		=> $forum['id'],
				'thread'	=> str_replace("&lt;", "<", $thread['title']),
				'pid'		=> $pid,
				'pow'		=> $forum['minpower'],
			));
			return header("Location: thread.php?pid={$pid}#{$pid}");

		}
		
	}
	/*
		Main page
	*/
	
	$ppp	  = get_ppp();	
	$smilies  = readsmilies();
	$postlist = thread_history($_GET['id'], $ppp + 1);
	
	$windowtitle = htmlspecialchars($forum['title']).": ".htmlspecialchars($thread['title'])." -- New Reply";
	pageheader($windowtitle, $forum['specialscheme'], $forum['specialtitle']);
	
	
	
	if ($loguser['id']) {
		$_POST['username'] = $loguser['name'];
		$passhint = 'Alternate Login:';
		$altloginjs = "<a href=\"#\" onclick=\"document.getElementById('altlogin').style.cssText=''; this.style.cssText='display:none'\">Use an alternate login</a>
			<span id=\"altlogin\" style=\"display:none\">";
	} else {
		$_POST['username'] = '';
		$passhint = 'Login Info:';
		$altloginjs = "<span>";
	}

	/*
		Quoting something?
	*/
	if ($_GET['postid']) {
		$post = $sql->fetchq("
			SELECT user, text, thread 
			FROM posts 
			WHERE id = {$_GET['postid']} AND (".((int) $ismod)." OR deleted = 0)
		");
		if ($post && $post['thread'] == $_GET['id']) { // Make sure the quote is in the same thread
			$post['text'] = str_replace('<br>','\n',$post['text']);
			$quoteuser = $sql->resultq("SELECT name FROM users WHERE id = {$post['user']}");
			$_POST['message'] = "[quote={$quoteuser}]{$post['text']}[/quote]\r\n";
			unset($post, $quoteuser);
		}
	}
	
	$links = array(
		$forum['title']  => "forum.php?id={$forum['id']}",
		$thread['title'] => "thread.php?id={$_GET['id']}",
		"New reply"      => NULL,
	);
	$barlinks = dobreadcrumbs($links); 
	
	if (isset($_POST['preview'])) {
		$data = array(
			// Text
			'message' => $_POST['message'],	
			#'head'    => "",
			#'sign'    => "",
			// Post metadata
			#'id'      => 0,
			'forum'   => $thread['forum'],
			#'ip'      => "",
			#'num'     => "",
			#'date'    => "",
			// (mod) Options
			'nosmilies' => $_POST['nosmilies'],
			'nohtml'    => $_POST['nohtml'],
			'nolayout'  => $_POST['nolayout'],
			'moodid'    => $_POST['moodid'],
			'noob'      => 0,
			// Attachments
			'attach_key' => $_GET['id'],
			#'attach_sel' => "",
		);
		print preview_post($user, $data);
	} else {
		// Use existing thread options
		$_POST['stick'] = $thread['sticky'];
		$_POST['close'] = $thread['closed'];
		$_POST['tannc'] = $thread['announcement'];
	}
	
	$modoptions	= "";
	if ($ismod) {
		$selsticky = $_POST['stick'] ? "checked" : "";
		$selclosed = $_POST['close'] ? "checked" : "";
		$seltannc  = $_POST['tannc'] ? "checked" : "";
		
		$modoptions = 
		"<tr>
			<td class='tdbg1 center'>
				<b>Moderator Options:</b>
			</td>
			<td class='tdbg2' colspan=2>
				<input type='checkbox' name='close' id='close' value=1 $selclosed><label for='close'>Close</label> -
				<input type='checkbox' name='stick' id='stick' value=1 $selsticky><label for='stick'>Sticky</label> - 
				<input type='checkbox' name='tannc' id='tannc' value=1 $seltannc ><label for='tannc'>Forum announcement</label>
			</td>
		</tr>";
	}
	
	$nosmilieschk   = $_POST['nosmilies'] ? "checked" : "";
	$nolayoutchk    = $_POST['nolayout']  ? "checked" : "";
	$nohtmlchk      = $_POST['nohtml']    ? "checked" : "";
	
	?>
	<?=$barlinks?>
	<?=$forum_error?>
	<form method="POST" action="newreply.php?id=<?=$_GET['id']?>" enctype="multipart/form-data" autocomplete=off>
	<table class='table'>
		<tr>
			<td class='tdbgh center' style='width: 150px'>&nbsp;</td>
			<td class='tdbgh center' colspan=2>&nbsp;</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center b'><?=$passhint?></td>
			<td class='tdbg2' colspan=2>
				<?=$altloginjs?>
					<!-- Hack around autocomplete, fake inputs (don't use these in the file) -->
					<input style="display:none;" type="text"     name="__f__usernm__">
					<input style="display:none;" type="password" name="__f__passwd__">
					<b>Username:</b> <input type='text' name=username VALUE="<?=htmlspecialchars($_POST['username'])?>" SIZE=25 MAXLENGTH=25 autocomplete=off>
					<b>Password:</b> <input type='password' name=password SIZE=13 MAXLENGTH=64 autocomplete=off>
				</span>
			</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center b'>Reply:</td>
			<td class='tdbg2' style='width: 800px' valign=top>
				<textarea wrap=virtual name=message ROWS=21 COLS=<?=$numcols?> style="width: 100%; max-width: 800px; resize:vertical;" autofocus><?=htmlspecialchars($_POST['message'], ENT_QUOTES)?></textarea>
			</td>
			<td class='tdbg2' width=*>
				<?=mood_layout(0, $userid, $_POST['moodid'])?>
			</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center'>&nbsp;</td>
			<td class='tdbg2' colspan=2>
				<?= auth_tag() ?>
				<input type='submit' class=submit name=submit VALUE="Submit reply">
				<input type='submit' class=submit name=preview VALUE="Preview reply">
			</td>
		</tr>
	
		<tr>
			<td class='tdbg1 center b'>Options:</td>
			<td class='tdbg2' colspan=2>
				<input type='checkbox' name="nosmilies" id="nosmilies" value="1"<?=$nosmilieschk?>><label for="nosmilies">Disable Smilies</label> -
				<input type='checkbox' name="nolayout"  id="nolayout"  value="1"<?=$nolayoutchk ?>><label for="nolayout" >Disable Layout</label> -
				<input type='checkbox' name="nohtml"    id="nohtml"    value="1"<?=$nohtmlchk   ?>><label for="nohtml"   >Disable HTML</label> | 
				<?=mood_layout(1, $userid, $_POST['moodid'])?>
			</td>
		</tr>
		<?=$modoptions?>
		<?=quikattach($_GET['id'], $userid)?>
	</table>
	<br>
	<?=$postlist?>
	</form>
	<?=$barlinks?>
<?php
	
	
	pagefooter();
