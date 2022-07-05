<?php
		$db_hostname = "localhost";
		$db_name     = "xxxxxxxxxxxxx";	
		$db_username = "xxxxxxxxxxxxx";
		$db_password = "xxxxxxxxxxxxx";
		
		$conn = mysqli_connect($db_hostname, $db_username, $db_password, $db_name) or die("error: " . mysql_error());

putenv('GDFONTPATH=' . realpath('.'));		
mysqli_set_charset($conn, "utf8");

?>
