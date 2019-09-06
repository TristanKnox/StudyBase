<html>
	<?php 
		session_start();
		$user = $_SESSION['user'];
		$userID = $_SESSION['userID'];

	 ?>
	<body>
		<h1> Welcome! </h1>
		<p> <?php echo $user ?> </p>
		<p> <?php echo $userID ?> </p>


	</body>


</html>