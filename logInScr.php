<?php
session_start();
include 'ConnectionInfo.php';



	
	$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME) or die("Cant Connect");
	if(!$link)
		echo "Cant Connect";
	
	$user = $_GET['userName'];
	$pass = $_GET['password'];

	$query = "SELECT *
				FROM user
				WHERE UserName = '$user'
				AND Password = '$pass'";
	
	$result = mySqli_query($link, $query) or die('Error getting data');

	$count = mysqli_num_rows($result);
	//echo $count;
	mysqli_close($link);
	$msg = "";
	if($count == 1)
	{
		while($row = mysqli_fetch_array($result))
			$userID = $row['UserID'];
		$_SESSION['user'] = $user;
		$_SESSION['userID'] = $userID;
		echo "LogIn Successful";
		header("location:StudyBaseMainPage.php");
	}
	

	else
	{
		$msg = "Invalid UserName or Password";
		echo "<script type='text/javascript'>alert('$msg');</script>";
		echo '<script>window.location.href = "index.php";</script>';

	}
	




?>