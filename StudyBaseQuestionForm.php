<?php
//include 'ConnectionInfo.php';
include 'PostScript.php';



$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME) or die("Cant Connect");
	if(!$link)
		echo "Cant Connect";
$subjectQuery = "SELECT Name
				FROM subject
				ORDER BY Name ASC";

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
	

$topicQuery = " SELECT topic.Name 
				FROM topic INNER JOIN coursetopic ON topic.TopicId = coursetopic.TopicID
					INNER JOIN course ON coursetopic.CourseID = course.CourseID
					INNER JOIN subject ON course.SubjectID = subject.SubjectID
				WHERE subject.Name = '$subject'
				ORDER BY Name DESC";



$subjectResult = mySqli_query($link, $subjectQuery) or die('Error getting data');
$topicResult = mySqli_query($link, $topicQuery) or die('Error getting data');

//$dMenue = '</select></form>';
mysqli_close($link);
?>



<!--///////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- Start of HTML -->

<html>

	<head>
		<link rel="stylesheet" href="StudyBaseStyleSheet.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
		<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
		<script>tinymce.init({ selector:'textarea' });</script>
		 
    </head>
	<body id = "questionForm">
		<div class = "Question"> 
			<img src = "Logo2.png"  class = "user">  
			<h2><?php echo $userName ?> Submit a question</h2> 
			<form  action = "<?php echo $_SERVER['PHP_SELF']; ?>" method = "POST"> <!-- action = 'PostScript.php'-->
				<p>Subjects</p>
				<select name = 'subject' onchange = "this.form.submit();">
					
					<?php
////////////////////////////////////////////////////////////////////////////////////////////////////////
///Subject Drop Down Menue
						if(isset($_POST['subject']))
							echo "<option>$subject</option>";
						else
							echo "<option value='' disabled selected>Choose a subject</option>";
						while($row = mysqli_fetch_array($subjectResult))
							echo "<option value='" . $row['Name'] . "'>" . $row['Name'] . "</option>";
/////////////////////////////////////////////////////////////////////////////////////////////////////////
					?>
				</select> 
				<p>Topics</p>
				 <select name = 'topic' onchange = "this.form.submit()";>
					<?php 
////////////////////////////////////////////////////////////////////////////////////////////////////////
///Topic Drop Down Menue
						if(isset($_POST['subject']))
						{
							if(isset($_POST['topic']))
								echo "<option>$topic</option>";
							else
								echo "<option value='' disabled selected>Select a topic</option>";
							echo "<option></option>";
							while($row = mysqli_fetch_array($topicResult))
								echo "<option value='" . $row['Name'] . "'>" . $row['Name'] . "</option>";
							
						}
						else
							echo "<option value='' disabled selected>Select a subject</option>";
////////////////////////////////////////////////////////////////////////////////////////////////////////
					 ?>
				</select>
				<p>Title</p> 
				<input name = 'title' type = 'text' palceholder = "place title here"></input>
				<p>Question</p> 
				<textarea id = 'questionId' name = 'question' rows="2" cols="50" placeholder = "place question here"></textarea> 
				<input id = 'signInButton'  onclick = 'callPHP()'; method = "POST" type = "submit" name = "" value = "Submit"><a href = "StudyBaseMainPage.php"> Return to Main</a> 
			</form>
<!--////////////-->
<!-- Java Script-->
<!--////////////-->
			<script type="text/javascript">
				function callPHP()
				{
					//var p = document.getElementById('question').value();
					//alert(document.getElementById('question').value);
					<?php 
						
						connect(); 
						p1();
						//post();
						post();
						disConnect();
						

					?>
				}
				/*function postValues()
				{
					jQuery(document).ready(function($)
					{
	               		$(".post").on("click",function()
	               		{
	                    	$.ajax(
	                    	{
	                        	url: "studyBaseQuestionForm.php",
	                        	type: "POST",
	                        	data: { question: document.getElementById('question').value(), title: document.getElementById('title').value()},
	                        	success: function(response){
	                              //do action  
	                       		 },
	                        	error: function(){
	                              // do action
	                        	}
	                    	});
	                	});
	            	});
				}*/

			</script>
		</div>
	</body>
</html>