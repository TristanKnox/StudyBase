

<!DOCTYPE html>

<html>
	
	
	<head>
		<link rel="stylesheet" href="StudyBaseStyleSheet.css">
		

		
    </head>
	<body id = "login">
	
		<p id = "upper"></p>
		<div class = "loginBox"> 
			<img src = "Logo2.png"  class = "user">  
			<h2>Log In here </h2> 
			<form action = 'logInScr.php'> 
				<p>UserName</p> 
				<input type = "text" name = "userName" placeholder = "Enter userName">
				<p>Password</p> 
				<input type = "password" name = "password" placeholder = "Enter password"> 
				<p id = "noMatch"></p>
				<input id = 'signInButton' onclick = '' type = "Submit" name = "" value 	= "Sign In">
				<a href = "CreateAccountFormPage.php"> Create account </a> 
			
			</form>
		</div>



</body>

</html>