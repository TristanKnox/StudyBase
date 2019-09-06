<?php

include 'ConnectionInfo.php';

$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME) or die("Cant Connect");
	if(!$link)
		echo "Cant Connect";

$user = $_GET['userName'];
$pass = $_GET['password'];
$type = $_GET['userType'];

if(strlen($user) < 1 )
{
	$msg = "No UserName Entered";
	echo "<script type='text/javascript'>alert('$msg');</script>";
	echo '<script>window.location.href = "CreateAccountFormPage.php";</script>';
}
else if(strlen($pass) < 1)
{
	$msg = "No Password Entered";
	echo "<script type='text/javascript'>alert('$msg');</script>";
	echo '<script>window.location.href = "CreateAccountFormPage.php";</script>';
}
else
{
	$query = "SELECT *
				FROM user
				WHERE UserName = '$user'";

	$result = mysqli_query($link, $query) or die('Error getting data');
	$count = mySqli_num_rows($result);
	/*
	if($user == null || $pass == null)
		echo "No UserName or Password Entered";
	*/

	if($count == 0)
	{
		
		$query = "INSERT INTO user (UserName, Password, UserType) VALUES ('$user', '$pass', '$type');"; 
		
		mysqli_query($link, $query) or die('Error Inserting Data');
		echo "Inserted";
		header("location:index.php");
	}
	else
	{
		$msg = "UserName already in use";
		echo "<script type='text/javascript'>alert('$msg');</script>";
		echo '<script>window.location.href = "CreateAccountFormPage.php";</script>';
	}
}


mysqli_close($link);


?>