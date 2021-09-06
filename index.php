  
<?php
	$host= "ddpractice_db_1";
	$user= "root";
	$pass= "root";
	$db="test_db";

	$conn= new mysqli($host, $user,$pass, $db);

	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	}
	echo($conn->server_version());
?>