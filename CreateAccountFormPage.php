<!DOCTYPE html>

<html>

	<head>
		<link rel="stylesheet" href="StudyBaseStyleSheet.css">
    </head>
	<body id = "create">

		<div class = "create"> 
			<img src = "Logo2.png"  class = "user">  
			<h2>Create account</h2> 
			<form action = 'newAccount.php'> 
				<p>UserName</p> 
				<input type = "text" name = "userName" placeholder = "Enter userName"> 
				<p>UserType</p> 
				<select name = 'userType'>
					<option value="Student"> Student  </option>
					<option value="Instructor">Instructor</option>
				</select>
				<p>Password</p> 
				<input type = "password" name = "password" placeholder = "Enter password"> 
				<input id = 'signInButton' onclick = "" type = "submit" name = "" value = "Sign In">
			</form>
		</div>
	</body>
<script> 

  
  

</script>
</html>