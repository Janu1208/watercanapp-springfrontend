<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/login.css">
<body style="text-align: center" onload="displayName()">
	<jsp:include page="headers.jsp"></jsp:include><br>


	<script type="text/javascript">
	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
		function login() {
			event.preventDefault();
			var phoneNumber = document.getElementById("phoneNumber").value;
			var password = document.getElementById("password").value;

			var formData = "phoneNumber=" + phoneNumber + "&password="
					+ password;

			var url = "http://localhost:9000/login?" + formData;
			console.log(url);
			console.log(phoneNumber);
			console.log(password);
			$
					.post(url)
					.then(
							function(response) {
								localStorage.setItem("LOGGED_IN_USER", JSON.stringify(response));
								var data = response;
								console.log(data);
								if (data != null) {
									alert("Sucessfully Login");
									window.location.href = "?pageName=userOperations.jsp";
								}
							},
							function(response) {
								var data = response;
								console.log(data);
								if (data.responseText != null) {
									alert(data.responseText);
									window.location.href = "?pageName=ulogin.jsp";
								}
							});

		}
	</script>
	<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<font color='red'>" + errorMessage + "</font>");

		}
	%>

<body>
	<div class="container">
		<section id="content">
			<form onsubmit="login()" method="post">
				<div class="login">
					<div class="form">
						<h1>Login Form</h1>
						<div>
							Contact No.: <input type="tel" placeholder="phone number" size=20
								required autofocus id="phoneNumber" name="phoneNumber" /><br>
							<br />
						</div>
						<div>
							Password: <input type="password"
								placeholder="Enter your password" size=20 required autofocus
								id="password" name="password"  /><br /> <br /> <input
								type="submit" value="Sign In" class="submit">
								<input type="checkbox" onclick="myFunction()">Show
						Password <br /> <span id="passwordlocation" style="color: red"></span>
						</div>
						
					</div>
				</div>
				<div>

					<a href="?pageName=newUser.jsp">New User</a>
				</div>
			</form>
			<!-- form -->
			<div class="button"></div>
			<!-- button -->
		</section>
		<!-- content -->
	</div>
	<!-- container -->

	<div class="toast">
		<div class="toast-header">Toast Header</div>
		<div class="toast-body">Invalid credentials.......</div>
	</div>


	<script type="text/javascript">
		function displayName() {
			var user = JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
			var name = user.name;
			return name;
		}
		displayName()
	</script>
</body>
</html>