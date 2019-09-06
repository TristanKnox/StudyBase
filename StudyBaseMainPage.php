<?php
//include 'Connection.php';
include 'Serch.php';

session_start();
$userName = $_SESSION['user'];
$userID = $_SESSION['userID'];

//connect();
//$subjectResult = getSubjectQuery();
//$topicResult =getTopicQuery();





$subject = "";
$GLOBALS['subject'] = $subject;
if(isset($_POST['subject']))
{
	$subject = $_POST['subject'];
	$GLOBALS['subject'] = $subject;
	$topic = "";
	$user = "";
}

$topic = "";
$GLOBALS['topic'] = $topic;
if(isset($_POST['topic']))
{
	$topic = $_POST['topic'];
	$GLOBALS['topic'] = $topic;
}

$user = "";
$GLOBALS['user'] = $user;
if(isset($_POST['user']))
{
	$user = $_POST['user'];
	$GLOBALS['user'] = $user;
}

$subjectResult = getSubjectQuery();
$topicResult =getTopicQuery($subject);
$userResult = getUserQuery($subject,$topic);



//connect();
?>
<!--////////////////////////////////////////////////////////////////////-->
<!--////////////////////// Begining Of HTML  ////////////////////////////-->
<!--////////////////////////////////////////////////////////////////////-->
<html>
	


	<head>
		<meta charset = "utf-8"> 
		<meta name = "viewport" content="width=device-width">
		<title> StudyBase learning solutions </title> 
		<link rel="stylesheet" href="StudyBaseStyleSheet.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
		<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
		<script>
		function serch()
		{
			<?php
				$serchresult;
				$serchresult = serchResults($subject,$topic,$user);
				$count = mysqli_num_rows($serchresult)
			?>
		}
		</script>
		 
    </head>



	<body id = "mainPage"> 
	<header> 
		<div class = "container">  
			<div id = "branding"> 
				<h1><span class = "highlight">StudyBase</span> Learning solutions</h1>  
				<h1>Welcom</h1> 
				<p><?php echo $userName ?></p>
		</div> 
			<nav>  
				<ul>  
					<li><a href = "StudyBaseQuestionForm.php">Post New question</a></li>  
					<li><a href = "">Post New topic</a></li>  
					<li><a href = "">Post New Subject</a></li>  
					<li><a href = "index.php">Log out</a></li> 
				</ul> 
			</nav> 
		</div>
	</header> 
	
	<section id="searchBar"> 
	<div class = "container">  
	<form action = "<?php echo $_SERVER['PHP_SELF']; ?>" method = "POST"> 

					 <!--////////////////////////////////////////////////////////////////////-->
					 <!--////////////////////// Subject DropDown ////////////////////////////-->
					 <!--////////////////////////////////////////////////////////////////////-->
	<p>Subjects</p>
		<select name = 'subject' onchange = 'this.form.submit();'>
			<?php
				if(isset($_POST['subject']))
					echo "<option>$subject</option>";
				else
					echo "<option value='' disabled selected>Filter by subject</option>";
				while($row = mysqli_fetch_array($subjectResult))
					echo "<option value='" . $row['Name'] . "'>" . $row['Name'] . "</option>";
			?>
		</select>                                                                                              

					 <!--////////////////////////////////////////////////////////////////////-->
					 <!--/////////////////////// Topic Drop Down ////////////////////////////-->
					 <!--////////////////////////////////////////////////////////////////////-->
		<p>Topics</p>
			<select name = 'topic' onchange = 'this.form.submit();'>
				<?php
					
					if(isset($_POST['subject']))
					{
					
						if(isset($_POST['topic']))
							echo "<option>$topic</option>";
						else
							echo "<option value='' disabled selected>Filter by topic</option>";
						echo "<option></option>";
						while($row = mysqli_fetch_array($topicResult))
							echo "<option value='" . $row['Name'] . "'>" . $row['Name'] . "</option>";
							
					}
					else
						echo "<option value='' disabled selected>Select a subject</option>";
						
				?>
			</select> 

					<!--////////////////////////////////////////////////////////////////////-->
					<!--/////////////////////// User Drop Down /////////////////////////////-->
					<!--////////////////////////////////////////////////////////////////////-->
			<p>User</p> 
			<select name = 'user' onchange = 'this.form.submit();'>
			<?php
					
				/*		
					if(isset($_POST['subject']))
					{
				*/
						if(isset($_POST['user']))
							echo "<option>$user</option>";
						else
							echo "<option value='' disabled selected>Filter by User</option>";
						echo "<option></option>";
						while($row = mysqli_fetch_array($userResult))
							echo "<option value='" . $row['UserName'] . "'>" . $row['UserName'] . "</option>";
				/*			
					}
					else
						echo "<option value='' disabled selected>Select a subject</option>";
				*/
				?>
		</select>
	</form>  
	<div = "searchItems">  
		<!--<input type="text" name="search" placeholder="Search.."> 
		<input type = "Submit" name = "" value = "Search" onclick = '' >-->
		<a href = "StudyBaseMainPage.php"> Reset Search </a> 
		
</div>
	</section>   
	


	<section id="table"> 
		<div class = "container">  
		<table bgcolor=#064b84> 
		<!-- /////////////////////////-->
		<!-- ////// Table Header /////-->
		<!-- /////////////////////////-->
			<tr> 
				<th>Title</th> 
				<th>Question</th> 
				<th>User</th> 
				<th>Topic</th> 
			</tr>";	
 <!--////////////////////////////////////////////////////////////////////-->
 <!--///////////////////////// Table Rows ///////////////////////////////-->
 <!--////////////////////////////////////////////////////////////////////-->
		<?php buildTalbe($subject,$topic,$user) ?>	
 <!--///////////////////////////////////////////////////////////////////////////////-->
 <!--///////////////////////// End of Table Contents ///////////////////////////////-->
 <!--///////////////////////////////////////////////////////////////////////////////-->

		</table>

		</div> 
	</section>


<script type="text/javascript">
	<?php	
			connect();
	
	?>
</script>





	</body>
</html>