<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/adminStyle.css">

</head>
<body style="text-align: center">
<jsp:include page="headers.jsp"></jsp:include><br>
	<script type="text/javascript">
	function myFunction() {
		var x = document.getElementById("Password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
		function reset() {
			window.location.href = "?pageName=adminLogin.jsp";
		}
		function adminlogin() {
			event.preventDefault();
			var Name = document.getElementById("Name").value;
			var Password = document.getElementById("Password").value;

			var formData = "Name=" + Name + "&Password=" + Password;
			var url = "http://localhost:9000/AdminLogin?"
					+ formData;
			console.log(url);
			/* $.post(url, function(response) {
				console.log(response);
				var data = JSON.parse(response);

				if (data.errorMessage != null) {
					alert(data.errorMessage)
				} else {
					alert("Login Succesful");
					window.location.href = "?pageName=adminOperations.jsp";
				}

			});
 */
			$.post(url).then(function(response) {
			       var data = response;
			       console.log(data);
			       if (data != null) {
			           alert("Sucessfully Login");
			           window.location.href = "?pageName=adminOperations.jsp";
			       }
			   },
			   function(response) {
			       var data =response;
			       console.log(data);
			       if (data.responseText!= null) {
			           alert(data.responseText);
			           window.location.href = "?pageName=adminLogin.jsp";
			       }
			   });
		}
	</script>
	<a class="login-trigger" href="#" data-target="#login"
		data-toggle="modal">Login</a>

	<div id="login" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-body">
					<button data-dismiss="modal" class="close">&times;</button>
					<h4>Login</h4>
					<form onsubmit="adminlogin()">

						<input type="text" class="username form-control" name="Name"
							id="Name" size=25 placeholder="Name" required /> <br>

						<input type="password" name="Password"
							class="password form-control" id="Password" size=25
							placeholder="password" required /> <br> 
							<input type="checkbox" onclick="myFunction()">Show
						Password <br /> <span id="passwordlocation" style="color: pink"></span>
							<input class="btn login" type="submit" value="Login" />

					</form>
				</div>
			</div>
		</div>
	</div>