<?php
include 'ConnectionInfo.php';

session_start();
$userName = $_SESSION['user'];
$userID = $_SESSION['userID'];

//exicute();
//setVars();
function setVars()
{
		$subject = "";
	if(isset($_POST['subject']))
		$subject = $_POST['subject'];

	$topic = "";
	if(isset($_POST['topic']))
		$topic = $_POST['topic'];

	$question = "";
	if(isset($_POST['question']))
		$question = $_POST['question'];

	$title = "";
	if(isset($_POST['title']))
		$title = $_POST['title'];



	//$GLOBALS['topic'] = $_GET['topic'];
	//$GLOBALS['question'] = $_GET['question'];
	//$GLOBALS['title'] = $_GET['title'];
	//echo "alert('$subject')";
	echo '<script>window.location.href = "StudyBaseQuestionForm.php";</script>';
}
function exicute()
{
	connect();
	post();
	disConnect();
}

function connect()
{
	$GLOBALS['link'] = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME) or die("Cant Connect");
	if(!$GLOBALS['link'])
		echo "alert('Error Can not Connect');";
	//else
	//echo "alert('Connected')";
}
function disConnect()
{
	$link = $GLOBALS['link'];
	mysqli_close($link);
	//echo "alert('disConnected')";
}

function p1()
{
	$link = $GLOBALS['link']; 

	$subject = $GLOBALS['subject'];
	$topic = $GLOBALS['topic'];
	$question = $GLOBALS['question'];
	//$question = $_GET['question'];
	$question = strip_tags(($question));
	$title = $GLOBALS['title'];;////////////////////////////=///Needs to be connected Latter
	$title = strip_tags(($title));
	$userID = $GLOBALS['userID'];///////////////////////////////Needs to be connnected Latter
	
	echo "alert('$subject' + ' ' + '$topic' + ' ' + '$question' + ' ' + '$title' + ' ' + '$userID')";
	
	if(strlen($topic)>1)
		if(strlen($question) > 1)
		{
			
			$query = "INSERT INTO question (Title, Body, PostedBy, TopicID) SELECT'$title', '$question', $userID, TopicID FROM topic WHERE topic.Name = '$topic'";
			
			//mysqli_query($link, $query) or die('Error: '.  mysqli_error($link));//'Error Inserting Data');

			//echo "alert('$subject' + ' ' + '$topic' + ' ' + '$question')";
		}
		//else
			//echo "alert('No Question Enterd')";
	//else
		//echo "alert('No Topic Selected')";
}
function post()
{
	
	$link = $GLOBALS['link']; 

	$subject = $GLOBALS['subject'];
	$topic = $GLOBALS['topic'];
	$question = $GLOBALS['question'];
	//$question = $_GET['question'];
	$question = strip_tags(($question));
	$title = $GLOBALS['title'];;////////////////////////////=///Needs to be connected Latter
	$title = strip_tags(($title));
	$userID = $GLOBALS['userID'];///////////////////////////////Needs to be connnected Latter
	
	//echo "alert('$subject' + ' ' + '$topic' + ' ' + '$question' + ' ' + '$title')";
	echo $user;
	if(strlen($topic)>1)
		if(strlen($question) > 1)
		{
			
			$query = "INSERT INTO question (Title, Body, PostedBy, TopicID) SELECT'$title', '$question', $userID, TopicID FROM topic WHERE topic.Name = '$topic'";
			
			echo $query;

			mysqli_query($link, $query) or die('Error: '.  mysqli_error($link));//'Error Inserting Data');

			header("location:StudyBaseMainPage.php");
		}
		else
			echo "alert('No Question Enterd')";
	else
		echo "alert('No Topic Selected')";
	
}


?>