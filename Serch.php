<?php

include 'ConnectionInfo.php';



function connect()
{
	$GLOBALS['link'] = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME) or die("Cant Connect");
	if(!$GLOBALS['link'])
		echo "Cant Connect";
	//else
	//	echo "alert('Connected')";
}

function disconect()
{
	$link = $GLOBALS['link'];
	mysqli_close($link);
	//echo "alert('disConnected')";
}


function getSubjectQuery()
{
	connect();
	$link = $GLOBALS['link'];
	$subjectQuery = "SELECT Name
				FROM subject
				ORDER BY Name ASC";
	$subjectResult = mySqli_query($link, $subjectQuery) or die('Error getting data');
	return $subjectResult;
}

function getTopicQuery($subject)
{
	connect();
	$link = $GLOBALS['link'];
	//$subject = $GLOBALS['subject'];
	//echo "alert('$subject')";
	$topicQuery = " SELECT topic.Name 
				FROM topic INNER JOIN coursetopic ON topic.TopicId = coursetopic.TopicID
					INNER JOIN course ON coursetopic.CourseID = course.CourseID
					INNER JOIN subject ON course.SubjectID = subject.SubjectID
				WHERE subject.Name = '$subject'
				ORDER BY Name DESC";
	$topicResult = mySqli_query($link, $topicQuery) or die('Error getting data');
	disconect();
	return $topicResult;
}

function getUserQuery($subject,$topic)
{
	connect();
	$link = $GLOBALS['link'];
	$userQuery = "SELECT DISTINCT user.UserName
					FROM user INNER JOIN question ON user.UserID = PostedBy
					INNER JOIN topic ON question.TopicID = topic.TopicID
					INNER JOIN coursetopic ON topic.TopicId = coursetopic.TopicID
					INNER JOIN course ON coursetopic.CourseID = course.CourseID
					INNER JOIN subject ON course.SubjectID = subject.SubjectID";
					//WHERE subject.Name = '$subject'";
					//ORDER BY user.UserName DESC";
	
	if(strlen($subject) > 1)
		$userQuery .= " WHERE subject.Name = '$subject'";
	
	if(strlen($topic) > 1)
		$userQuery .= " AND topic.Name = '$topic'";
	

	$userQuery .= " ORDER BY user.UserName DESC";
	//echo "alert('$userQuery')";
	$userResult = mySqli_query($link, $userQuery) or die('Error getting data');
	disconect();
	return $userResult;
}



function serchResults($subject,$topic,$user)
{
	connect();
	//echo "alert('worked')";
	$link = $GLOBALS['link'];
	$serchQuery = "SELECT question.Title, question.Body, user.UserName, topic.Name 
					FROM user INNER JOIN question ON user.UserID = PostedBy
					INNER JOIN topic ON question.TopicID = topic.TopicID
					INNER JOIN coursetopic ON topic.TopicId = coursetopic.TopicID
					INNER JOIN course ON coursetopic.CourseID = course.CourseID
					INNER JOIN subject ON course.SubjectID = subject.SubjectID";
					//WHERE subject.Name = '$subject'";
	if(strlen($subject) > 1)
		$serchQuery .=	" WHERE subject.Name = '$subject'";
		
	if(strlen($topic) > 1)
		$serchQuery .= " AND topic.Name = '$topic'";
	if(strlen($user) > 1)
	{
		if(strlen($subject) > 1)
				$serchQuery .= " AND user.UserName = '$user'";
		else
			$serchQuery .= " WHERE user.UserName = '$user'";
	}
	$serchQuery .= " ORDER BY question.Title ASC";
	
	$serchResult = mySqli_query($link, $serchQuery) or die('Error getting data');
	disconect();
	return $serchResult;
}


function buildTalbe($subject,$topic,$user)
{
	$serchResult = serchResults($subject,$topic,$user);
	//echo "<p>Test</p>";

	//echo "</div></section><section id='table'><div class = 'container'><table bgcolor=#064b84>";
	//echo "<tr> <th>Title</th> <th>Question</th> <th>User</th> <th>Topic</th> </tr>";
	if(strlen($subject) > 1 or strlen($user) > 1)
		while($row = mysqli_fetch_array($serchResult))
			echo "<tr> <td>".$row[0]."</td> <td>".$row[1]."</td> <td>".$row[2]."</td> <td>".$row[3]."</td> </tr>";


}
?>