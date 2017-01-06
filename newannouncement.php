<?php

	// Forked from newreply.php, since good god what was in announcement.php was completely outdated
	require 'lib/function.php';
	
	$id			= filter_int($_GET['id']);
	$page		= filter_int($_GET['page']);
	$quoteid	= filter_int($_GET['postid']);
	
	$meta['noindex'] = true;
	
	// Make sure the forum exists and we can access it
	$forum = $sql->fetchq("SELECT id, title, minpower, specialscheme, specialtitle FROM forums WHERE id = $id");
	if ($forum && ($forum['minpower'] && $forum['minpower'] > $forum['powerlevel']))
		errorpage("Couldn't enter the forum. You don't have access to this restricted forum.", 'index.php', 'the index page');
	
	if($sql->resultq("SELECT 1 FROM forummods WHERE forum = $id AND user = {$loguser['id']}"))
		$ismod = 1;
	
	$canpost = ($isadmin || ($ismod && $forum));
	if (!$canpost)
		errorpage("Silly user, you have no permission to do this!");	
	
	$ppp	= isset($_GET['ppp']) ? ((int) $_GET['ppp']) : ($loguser['id'] ? $loguser['postsperpage'] : $config['default-ppp']);
	$ppp	= max(min($ppp, 500), 1);
	
	
	// register_globals!
	$username 	= filter_string($_POST['username'], true);
	$password 	= filter_string($_POST['password'], true);
	
	$message	= filter_string($_POST['message'], true);
	$title		= filter_string($_POST['title'], true);
	
	
	$moodid		= filter_int($_POST['moodid']);
	$nosmilies	= filter_int($_POST['nosmilies']);
	$nolayout	= filter_int($_POST['nolayout']);
	$nohtml		= filter_int($_POST['nohtml']);
	
	

	if (isset($_POST['submit']) || isset($_POST['preview'])) {
		
		if ($loguser['id'] && !$password) {
			$userid = $loguser['id'];
			$user	= $loguser;
		} else {
			$userid 	= checkuser($username,$password);
			$user 		= $sql->fetchq("SELECT * FROM users WHERE id = '$userid'");
		}
		

		$error = '';
		if ($userid == -1) {
			$error	= "Either you didn't enter an existing username, or you haven't entered the right password for the username.";
		} else {
			
			$user	= $sql->fetchq("SELECT * FROM users WHERE id='$userid'");
			if (!$message)
				$error	= "You didn't enter anything in the announcement.";
			if (!$title)
				$error	= "You didn't enter anything in the title.";
			
			// NOTE: Since to post here we check for mod status at the beginning, alternate non-mod usernames of a mod are allowed to post.
		}
		
		if ($error) 
			errorpage("Couldn't enter the announcement. $error", "announcement.php?f=$id", 'the announcements', 0);
		
		// All OK

		$sign	= $user['signature'];
		$head	= $user['postheader'];
		
		$numposts		= $user['posts']+ 1;

		$numdays		= (ctime()-$user['regdate'])/86400;
		$tags			= array();
		$message		= doreplace($message,$numposts,$numdays,$user['id'], $tags);
		$tagval			= json_encode($tags);
		$rsign			= doreplace($sign,$numposts,$numdays,$user['id']);
		$rhead			= doreplace($head,$numposts,$numdays,$user['id']);
		$currenttime	= ctime();
		
		if (isset($_POST['submit'])) {
			check_token($_POST['auth']);
			
			$sql->beginTransaction();

			$querycheck = array();

			if ($nolayout) {
				$headid = 0;
				$signid = 0;
			} else {
				$headid = getpostlayoutid($head);
				$signid = getpostlayoutid($sign);
			}
			
			$sql->queryp("INSERT INTO `announcements` (`forum`, `user`, `date`, `ip`, `headid`, `signid`, `moodid`, `text`, `title`, `tagval`, `options`) ".
						 "VALUES              (:forum,  :user,  :date,  :ip,  :headid,  :signid,  :moodid,  :text,  :title,  :tagval,  :options)",
					 [
						'forum'				=> $id,
						'user'				=> $user['id'],
						'date'				=> $currenttime,
						'ip'				=> $_SERVER['REMOTE_ADDR'],
						
						'headid'			=> $headid,
						'signid'			=> $signid,
						'moodid'			=> $moodid,
						
						'title'				=> xssfilters($title),
						'text'				=> xssfilters($message),
						'tagval'			=> $tagval,
						'options'			=> $nosmilies . "|" . $nohtml,
						
					 ], $querycheck);
					 
			//$pid = $sql->insert_id();

			
			if ($sql->checkTransaction($querycheck)) {
				
				xk_ircout("announcement", $user['name'], array(
					'forum'		=> $forum['title'],
					'fid'		=> $id,
					'thread'	=> str_replace("&lt;", "<", $title),
					'pid'		=> 0, //$pid,
					'pow'		=> $forum['minpower'],
				));

				return header("Location: announcement.php?f=$id");
				
			} else {
				errorpage("An error occurred while creating the post.");
			}

		}
		
	}
	/*
		Main page
	*/
	
		
	$smilies = readsmilies();
	
	$windowtitle = "{$config['board-name']} --".($id ? " ".htmlspecialchars($forum['title']).":" : "")." Announcements";
	pageheader($windowtitle, $forum['specialscheme'], $forum['specialtitle']);
	
	/*
		Previous posts in the thread
	*/
	$posts = $sql->query("
		SELECT $userfields, u.posts, a.user, a.text, a.options
		FROM announcements a
		LEFT JOIN users u ON a.user = u.id
		WHERE a.forum = $id
		ORDER BY a.id DESC
		LIMIT ".($ppp + 1)."
	");
	$i = 0;
		
	$postlist = 
	"<tr>
		<td class='tdbgh center' colspan=2 style='font-weight:bold'>
			Announcement history
		</td>
	</tr>
	<tr>
		<td class='tdbgh center' width=150>User</td>
		<td class='tdbgh center'>Post</td>
	</tr>";
	
	
	if ($sql->num_rows($posts)) {
	
		while ($post = $sql->fetch($posts)) {
			
			$bg = ((($i++) & 1) ? 'tdbg2' : 'tdbg1');
			
			if ($ppp-- > 0){
				$userlink = getuserlink($post);
				$postlist .=
					"<tr>
						<td class='tbl $bg' valign=top>
							{$userlink}
							<span class='fonts'><br>
								Posts: {$post['posts']}
							</span>
						</td>
						<td class='tbl $bg' valign=top>
							".doreplace2(dofilters($post['text']), $post['options'])."
						</td>
					</tr>";
			} else {
				$postlist .= "<tr><td class='tdbgh center' colspan=2>This is a long thread. Click <a href='thread.php?id=$id'>here</a> to view it.</td></tr>";
			}
		}
		
	} else {
		$postlist .= "<tr><td class='tdbg1 center' colspan=2><i>There are no announcements".($id ? " in this forum" : "")."</i></td></tr>";
	}
	
	
	
	
	if ($loguser['id']) {
		$username = $loguser['name'];
		$passhint = 'Alternate Login:';
		$altloginjs = "<a href=\"#\" onclick=\"document.getElementById('altlogin').style.cssText=''; this.style.cssText='display:none'\">Use an alternate login</a>
			<span id=\"altlogin\" style=\"display:none\">";
	} else {
		$username = '';
		$passhint = 'Login Info:';
		$altloginjs = "<span>";
	}

	/*
		Quoting something?
	*/
	if ($quoteid) {
		$post = $sql->fetchq("SELECT user, text, forum FROM announcements WHERE id = $quoteid");
		$post['text'] = str_replace('<br>','\n',$post['text']);
		$quoteuser = $sql->resultq("SELECT name FROM users WHERE id = {$post['user']}");
		if($post['forum'] == $id) // Make sure the quote is in the same thread
			$message = "[quote={$quoteuser}]{$post['text']}[/quote]\r\n";
	}
	
	$barlinks = "<span class='font'><a href='index.php'>{$config['board-name']}</a> ".($id ? "- <a href='forum.php?id=$id'>".htmlspecialchars($forum['title'])."</a> " : "")."- Announcements</span>";

	if (isset($_POST['preview'])) {
		
		loadtlayout();
		$ppost					= $user;
		$ppost['uid']			= $userid;
		$ppost['num']			= 0;
		$ppost['lastposttime']	= $currenttime;
		$ppost['date']			= $currenttime;
		$ppost['moodid']		= $moodid;
		$ppost['noob']			= 0;
		

		if ($nolayout) {
			$ppost['headtext'] = "";
			$ppost['signtext'] = "";
		} else {
			$ppost['headtext'] = $rhead;
			$ppost['signtext'] = $rsign;
		}

		$ppost['text']			= "<center><b>$title</b></center><hr>$message";
		$ppost['options']		= $nosmilies . "|" . $nohtml;
		$ppost['act'] 			= $sql->resultq("SELECT COUNT(*) num FROM posts WHERE date > ".(ctime() - 86400)." AND user = {$user['id']}");
		if ($isadmin)
			$ip = " | IP: <a href='ipsearch.php?ip={$_SERVER['REMOTE_ADDR']}'>{$_SERVER['REMOTE_ADDR']}</a>";
	
		?>
		<table class='table'>
			<tr>
				<td class='tdbgh center'>
					Post preview
				</td>
			</tr>
		</table>
		<table class='table'>
			<?=threadpost($ppost,1)?>
		</table>
		<br>
		<?php
		
	}
	
	$nosmilieschk   = $nosmilies ? "checked" : "";
	$nolayoutchk    = $nolayout  ? "checked" : "";
	$nohtmlchk      = $nohtml    ? "checked" : "";
	
	?>
	<?=$barlinks?>
	<form action="newannouncement.php?id=<?=$id?>" name=replier method=post autocomplete=off>
	<body onload=window.document.REPLIER.message.focus()>
	<table class='table'>
		<tr>
			<td class='tdbgh center' style='width: 150px'>&nbsp;</td>
			<td class='tdbgh center' colspan=2>&nbsp;</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center'>
				<b><?=$passhint?></b>
			</td>
			<td class='tdbg2' colspan=2>
				<?=$altloginjs?>
					<b>Username:</b> <input type='text' name=username VALUE="<?=htmlspecialchars($username)?>" SIZE=25 MAXLENGTH=25 autocomplete=off>

					<!-- Hack around autocomplete, fake inputs (don't use these in the file) -->
					<input style="display:none;" type="text"     name="__f__usernm__">
					<input style="display:none;" type="password" name="__f__passwd__">

					<b>Password:</b> <input type='password' name=password SIZE=13 MAXLENGTH=64 autocomplete=off>
				</span>
			</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center'><b>Announcement title:</b></td>
			<td class='tdbg2' colspan=2>
				<input type='text' name=title SIZE=70 MAXLENGTH=100 value="<?=htmlspecialchars($title)?>">
			</td>			
		</tr>
		<tr>
			<td class='tdbg1 center'><b>Announcement:</b></td>
			<td class='tdbg2' style='width: 800px' valign=top>
				<textarea wrap=virtual name=message ROWS=21 COLS=<?=$numcols?> style="width: 100%; max-width: 800px; resize:vertical;"><?=htmlspecialchars($message, ENT_QUOTES)?></textarea>
			</td>
			<td class='tdbg2' width=*>
				<?=moodlist($moodid)?>
			</td>
		</tr>
		
		<tr>
			<td class='tdbg1 center'>&nbsp;</td>
			<td class='tdbg2' colspan=2>
				<input type='hidden' name=auth value="<?=generate_token()?>">
				<input type='submit' class=submit name=submit VALUE="Post announcement">
				<input type='submit' class=submit name=preview VALUE="Preview announcement">
			</td>
		</tr>
	
		<tr>
			<td class='tdbg1 center'><b>Options:</b></td>
			<td class='tdbg2' colspan=2>
				<input type='checkbox' name="nosmilies" id="nosmilies" value="1"<?=$nosmilieschk?>><label for="nosmilies">Disable Smilies</label> -
				<input type='checkbox' name="nolayout"  id="nolayout"  value="1"<?=$nolayoutchk ?>><label for="nolayout" >Disable Layout</label> -
				<input type='checkbox' name="nohtml"    id="nohtml"    value="1"<?=$nohtmlchk   ?>><label for="nohtml"   >Disable HTML</label>
			</td>
		</tr>
	</table>
	<br>
	<table class='table'><?=$postlist?></table>
	</form>
	<?=$barlinks?>
<?php
	
	
	pagefooter();

