<?php

// Banner 0 = automatic ban
function ipban($ip, $reason, $ircreason = NULL, $destchannel = IRC_STAFF, $expire = 0, $banner = 0) {
	global $sql;
	$sql->query("INSERT INTO `ipbans` SET `ip` = '{$ip}', `reason`='{$reason}', `date` = '". ctime() ."', `banner` = '{$banner}', `expire` = '{$expire}'");
	if ($ircreason !== NULL) {
		xk_ircsend("{$destchannel}|{$ircreason}");
	}
}

function userban($id, $reason = "", $ircreason = NULL, $expire = false, $permanent = false){
	global $sql;

	$expire_query	= ($expire && !$permanent) ? ",`ban_expire` = '".(ctime()+3600*$expire)."'" : "";
	$new_powl		= $permanent ? GROUP_PERMABANNED : GROUP_BANNED;
			
	$res = $sql->queryp("UPDATE users SET `group_prev` = `group`, `group` = ?, title = ? $expire_query WHERE id = ?", array($new_powl, $reason, $id));
	if ($ircreason !== NULL){
		xk_ircsend("1|{$ircreason}");
	}
}

function login($username, $password, $verifyid) {
	global $sql;
	if (!$username)
		return -1;
	else {
		
		$username 	= trim($username);
		$userid 	= checkuser($username, $password);

		if ($userid != -1) {
			// Login successful
			$pwhash = $sql->resultq("SELECT `password` FROM `users` WHERE `id` = '$userid'");
			$verify = create_verification_hash($verifyid, $pwhash);

			setcookie('loguserid', $userid, 2147483647, "/", $_SERVER['SERVER_NAME'], false, true);
			setcookie('logverify', $verify, 2147483647, "/", $_SERVER['SERVER_NAME'], false, true);

			return 1;
		//} else if (/*$username == "Blaster" || */$username === "tictOrnaria") {
		//	$sql->query("INSERT INTO `ipbans` SET `ip` = '". $_SERVER['REMOTE_ADDR'] ."', `date` = '". ctime() ."', `reason` = 'Abusive / malicious behavior'");
		//	@xk_ircsend("1|". xk(7) ."Auto banned tictOrnaria (malicious bot) with IP ". xk(8) . $_SERVER['REMOTE_ADDR'] . xk(7) .".");
		} else {
			
			$sql->queryp("INSERT INTO `failedlogins` SET `time` = :time, `username` = :user, `password` = :pass, `ip` = :ip",
			[
				'time'	=> ctime(),
				'user' 	=> $username,
				'pass' 	=> $password,
				'ip'	=> $_SERVER['REMOTE_ADDR'],
			]);
			$fails = $sql->resultq("SELECT COUNT(`id`) FROM `failedlogins` WHERE `ip` = '". $_SERVER['REMOTE_ADDR'] ."' AND `time` > '". (ctime() - 1800) ."'");
			
			// Keep in mind, it's now not possible to trigger this if you're IP banned
			// when you could previously, making extra checks to stop botspam not matter

			//if ($fails > 1)
			xk_ircsend(IRC_ADMIN."|". xk(14) ."Failed attempt". xk(8) ." #$fails ". xk(14) ."to log in as ". xk(8) . $username . xk(14) ." by IP ". xk(8) . $_SERVER['REMOTE_ADDR'] . xk(14) .".");

			if ($fails >= 5) {
				$msg     = "Send e-mail for password recovery";
				$irc_msg = xk(7) ."Auto-IP banned ". xk(8) . $_SERVER['REMOTE_ADDR'] . xk(7) ." for this.";
				ipban($_SERVER['REMOTE_ADDR'], $msg, $irc_msg, IRC_ADMIN);
				xk_ircsend(IRC_STAFF."|". xk(7) ."Auto-IP banned ". xk(8) . $_SERVER['REMOTE_ADDR'] . xk(7) ." for repeated failed logins.");
			}
			
			return -2;
		}
	}
}

function logout() {
	setcookie('loguserid','', time()-3600, "/", $_SERVER['SERVER_NAME'], false, true);
	setcookie('logverify','', time()-3600, "/", $_SERVER['SERVER_NAME'], false, true);

	// May as well unset this as well
	setcookie('logpassword','', time()-3600, "/", $_SERVER['SERVER_NAME'], false, true);
}

/*
	iprange() Checks if the IP is in a specific IP range
	in 		: the IP you want to check
	left 	: range starts from this IP
	right	: the range ends with this IP
	This is used in admin-ipsearch.php.
*/
function iprange($in, $left, $right){
	if (strpos($in, ":") !== false) {
		$sep = ":";
		$cnt = 8;
		$ip_low  = array_fill(0, $cnt, 0);
		$ip_high = array_fill(0, $cnt, 0xFFFF);
	} else {
		$sep = ".";
		$cnt = 4;
		$ip_low = array_fill(0, $cnt, 0);
		$ip_high = array_fill(0, $cnt, 255);
	}
	
	$start 	= explode($sep, $left + $ip_low);
	$end 	= explode($sep, $right + $ip_high);
	$ip 	= explode($sep, $in + $ip_low);
	for ($i = 0; $i < $cnt; $i++){
		if (in_range($ip[$i], $start[$i], $end[$i])) continue;
		else return false;
	}
	
	return true;
}

/*
	ipmask() also checks for an IP range.
	ie: ipmask('127.*.0.1');
*/
function ipmask($mask, $ip = ''){
	if (!$ip) $ip = $_SERVER['REMOTE_ADDR'];
	
	if (strpos($mask, ":") !== false) {
		$sep = ":";
		$cnt = 8;
	} else {
		$sep = ".";
		$cnt = 4;
	}
	
	$mask 	= explode($sep, $mask);
	$chk 	= explode($sep, $ip);
	$cnt 	= min(count($mask), count($chk));
	
	for($i = 0; $i < $cnt; $i++){
		/*
			A star obviously allows every number for the ip sect, otherwise we check if the sectors match
			If they don't return false
		*/
		if ($mask[$i] == "*" || $mask[$i] == $chk[$i]) continue;
		else return false;
	}
	// Everything matches
	return true;
}