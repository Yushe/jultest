<?php
	
	function threadpost($post,$bg,$pthread='') {
		
		global $loguser, $quote, $edit, $ip, $sep, $tlayout, $blockedlayouts; //${"tablebg$bg"};
		
		// Fetch an array containing all blocked layouts now
		if (!isset($blockedlayouts)) {
			global $sql;
			$blockedlayouts = $sql->getresultsbykey("SELECT blocked, 1 FROM blockedlayouts WHERE user = {$loguser['id']}");
			if (!$blockedlayouts)
				$blockedlayouts = 0;
		}
		
		$post = setlayout($post);
		
		//$p = $post['id'];
		//$u = $post['uid'];
		
		$set['bg']    = $bg; //${"tablebg$bg"};
		//$set['tdbg']  = "<td class='tbl font tdbg$bg' valign=top";

		$userlink = getuserlink($post, $post['uid'], "url".$post['uid']);
		//unset($postuser);

		$set['userrank'] = getrank($post['useranks'], str_replace("<div", "<<z>idiot", $post['title']), $post['posts'], $post['powerlevel']);
		
		$set['userlink'] = "<a name={$post['uid']}></a>{$userlink}";
		$set['date']     = printdate($post['date']);

		$set['location'] = $post['location'] ? "<br>From: {$post['location']}" : "";

		if($post['picture'] || ($post['moodid'] && $post['moodurl'])) {
			
			$post['picture']  = htmlspecialchars($post['picture']);
			$set['userpic']   = "<img src=\"{$post['picture']}\">";
			$set['picture']   = $post['picture'];
			
			if ($post['moodid'] && $post['moodurl']) {
				// Replace $ placeholder with the actual image number
				$set['picture'] = str_replace(array('$', '>', '"'), array($post['moodid'], '%3E', '&quot;'), $post['moodurl']);
				$set['userpic'] = "<img src=\"{$set['picture']}\">";
			}
			//   $userpicture="<img src=\"$user['picture']\" name=pic$p onload=sizelimit(pic$p,60,100)>";
		} else {
			$set['userpic'] = "";
		}

		if($post['signtext']) {
			$post['signtext'] = $sep[$loguser['signsep']].$post['signtext'];
		}

		if($pthread) { 
			$set['threadlink'] = "<a href=thread.php?id={$pthread['id']}>{$pthread['title']}</a>";
		}

		$post['text'] = doreplace2($post['text'], $post['options']);
	//  if (strpos($post['text'], "http://hyperhacker.no-ip.org/b/smilies/lolface.png") || strpos($post['text'], "images/smilies/roflx.gif")) $post['text'] = "<img src=images/smilies/roflx.gif><br><br><small>(Excessive post content hidden)</small>";

		if (filter_int($post['editdate'])) {
			$post['edited'] = " (last edited by {$post['edited']} at ".printdate($post['editdate']).")";
		}
		
		
		return dofilters(postcode($post,$set));
	}

	function preplayouts($posts) {
		global $sql, $postl;

		$ids = array();

		// Just fetch everything now instead of hitting the DB for each new header/signature encountered
		while ($ps = $sql->fetch($posts)) {
			if ($ps['headid']) $ids[] = $ps['headid'];
			if ($ps['signid']) $ids[] = $ps['signid'];
		}

		if (!count($ids)) return;
		$postl = $sql->getresultsbykey("SELECT id, text FROM postlayouts WHERE id IN (".implode(",", array_unique($ids, SORT_NUMERIC)).")");
	}

	function setlayout($post) {
		global $sql,$loguser,$postl,$blockedlayouts;
		
		
		if($loguser['viewsig']!=1) { // Autoupdate
			$post['headid']=$post['signid']=0;
		}
		
		//$blocked = $sql->resultq("SELECT 1 FROM blockedlayouts WHERE user = {$loguser['id']} AND blocked = {$post['uid']}", 0, 0, true); // Enable caching

		if(!$loguser['viewsig'] || isset($blockedlayouts[$post['uid']])){ // Disabled
			$post['headtext']=$post['signtext']='';
			return $post;
		}

		if($loguser['viewsig']!=2){ // Not Autoupdate
			if($headid=filter_int($post['headid'])) {
				// just in case
				if($postl[$headid] === NULL) $postl[$headid]=$sql->resultq("SELECT text FROM postlayouts WHERE id=$headid");
				$post['headtext']=$postl[$headid];
			}
			if($signid=filter_int($post['signid'])) {
				// just in case
				if($postl[$signid] === NULL) $postl[$signid]=$sql->resultq("SELECT text FROM postlayouts WHERE id=$signid");
				$post['signtext']=$postl[$signid];
			}
		}

		$post['headtext']=settags($post['headtext'],filter_string($post['tagval']));
		$post['signtext']=settags($post['signtext'],filter_string($post['tagval']));

		if($loguser['viewsig']==2){ // Autoupdate
			$post['headtext']=doreplace($post['headtext'],$post['num'],($post['date']-$post['regdate'])/86400,$post['uid']);
			$post['signtext']=doreplace($post['signtext'],$post['num'],($post['date']-$post['regdate'])/86400,$post['uid']);
		}
		
		// Prevent topbar CSS overlap for non-autoupdating layouts
		if ($post['headid'])
			$post['headtext'] = preg_replace("'\.(top|side|main|cont)bar{$post['uid']}'si", ".$1bar{$post['uid']}_{$post['headid']}", $post['headtext']);
		else
			$post['headtext'] = preg_replace("'\.(top|side|main|cont)bar{$post['uid']}'si", ".$1bar{$post['uid']}_x{$post['id']}", $post['headtext']);
		
		$post['headtext']=doreplace2($post['headtext']);
		$post['signtext']=doreplace2($post['signtext']);
		//	$post['text']=doreplace2($post['text'], $post['options']);
		return $post;
	}

function syndrome($num, $double=false, $bar=true){
	$bar	= false;
	$a		= '\'>Affected by';
	$syn	= "";
	if($num>=75)  {  $syn="83F3A3$a 'Reinfors Syndrome'";           $last=  75; $next=  25;	}
	if($num>=100) {  $syn="FFE323$a 'Reinfors Syndrome' +";         $last= 100; $next=  50;	}
	if($num>=150) {  $syn="FF5353$a 'Reinfors Syndrome' ++";        $last= 150; $next=  50;	}
	if($num>=200) {  $syn="CE53CE$a 'Reinfors Syndrome' +++";       $last= 200; $next=  50;	}
	if($num>=250) {  $syn="8E83EE$a 'Reinfors Syndrome' ++++";      $last= 250; $next=  50;	}
	if($num>=300) {  $syn="BBAAFF$a 'Wooster Syndrome'!!";          $last= 300; $next=  50;	}
	if($num>=350) {  $syn="FFB0FF$a 'Wooster Syndrome' +!!";        $last= 350; $next=  50;	}
	if($num>=400) {  $syn="FFB070$a 'Wooster Syndrome' ++!!";       $last= 400; $next=  50;	}
	if($num>=450) {  $syn="C8C0B8$a 'Wooster Syndrome' +++!!";      $last= 450; $next=  50;	}
	if($num>=500) {  $syn="A0A0A0$a 'Wooster Syndrome' ++++!!";     $last= 500; $next= 100;	}
	if($num>=600) {  $syn="C762F2$a 'Anya Syndrome' +++++!!!";      $last= 600; $next= 200;	}
	if($num>=800) {  $syn="62C7F2$a 'Xkeeper Syndrome' +++++!!";/*  $last= 600; $next= 200;		}
	if($num>=1000) {  $syn="FFFFFF$a 'Something higher than Xkeeper Syndrome' +++++!!";*/		}

	if($syn) {
		if ($next && $bar) {
			$barw1	= min(round(($num - $last) / $next * 150), 150); // Done / Total * Max bar size
			$barw2	= 150 - $barw1;
			$barimg	= "red.png";

			if ($double == true) {
				$hi = 16;
				$barw1 *= 2;
				$barw2 *= 2;
			} else {
				$hi	= 8;
			}

			if ($next	>= 100) $barimg	= "special.gif";
			$bar	= "<br>
				<nobr>
					". generatenumbergfx($num, 3, $double) ."
					<img src='images/num1/barleft.png' height=$hi>
					<img src='images/num1/bar-on$barimg' width=$barw1 height=$hi>
					<img src='images/num1/bar-off.png' width=$barw2 height=$hi>
					<img src='images/num1/barright.png' height=$hi>
					". generatenumbergfx($next - ($num - $last), 3, $double) ."
				</nobr>";
		}
		$syn="<br><i><span style='color: #$syn</span></i>$bar<br>";
	}

	return $syn;
}
