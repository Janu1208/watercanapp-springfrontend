<html>
<head>
</head>
<body style="text-align: center" font-color="red">
<div class="img">
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
			function reset() {
				window.location.href = "?pageName=newUser.jsp";
			}
			function register() {
				event.preventDefault();
				var name = document.getElementById("name").value;
				var phoneNumber = document.getElementById("phoneNumber").value;
				var password = document.getElementById("password").value;

				var formData = "name=" + name + "&phoneNumber=" + phoneNumber
						+ "&password=" + password;
				var url = "http://localhost:9000/register?" + formData;
				console.log(name);
				console.log(phoneNumber);
				console.log(password);
				console.log(url);
				$.post(url).then(function(response) {
				       var data = response;
				       console.log(data);
				       if (data != null) {
				           alert("Sucessfully Registered");
				           window.location.href = "?pageName=ulogin.jsp";
				       }
				   },
				   function(response) {
				       var data =response;
				       console.log(data);
				       if (data.responseText!= null) {
				           alert("Mobile Number already exists..Please choose a different one");
				           window.location.href = "?pageName=newUser.jsp";
				       }
				   });
				}
			function validateName() {
				var name = document.getElementById("name").value;
				var nameRegex = /^[A-Za-z]/;
				if (nameRegex.test(name)) {
					document.getElementById("namelocation").innerHTML = "";
					document.getElementById("myBtn").disabled = false;

				} else {
					document.getElementById("namelocation").innerHTML = "Name should contain alphabets only";
					document.getElementById("myBtn").disabled = true;
				}
			}

			function validatePhoneNumber() {
				var phoneNumber = document.getElementById("phoneNumber").value;
				var phoneNumberRegex = /^[0][1-9]\d{9}$|^[1-9]\d{9}$/;
				if (phoneNumberRegex.test(phoneNumber)) {

					document.getElementById("phoneNumberlocation").innerHTML = "";
					document.getElementById("myBtn").disabled = false;

				}

				else {
					document.getElementById("phoneNumberlocation").innerHTML = "Enter valid phone number";
					document.getElementById("myBtn").disabled = true;
				}
            
			}

			function validatePassword() {
				
				var password = document.getElementById("password").value;
				var passwordRegex = /^(?=[a-zA-Z0-9#@$?]{8,}$)(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).*/;
				if (passwordRegex.test(password)) {
					document.getElementById("passwordlocation").innerHTML = "";
					document.getElementById("myBtn").disabled = false;
				} else {
					document.getElementById("passwordlocation").innerHTML = "Please check password policy";
					document.getElementById("myBtn").disabled = true;
				}
				
			}
		</script>
		<form onsubmit="register()">
		  <div class="text-block">
			<h2 style="color: DARKVIOLET;">Registration Details</h2>

			<p>
				<font color="orangered" size="+1"><tt>
						<b>*</b>
					</tt></font> Indicates a required field
			</p>
			<br />
			<table align="center">
				<tr>
					<td><label style="font-family: verdana;"> Name:</label></td>


					<td><input type="text" name="name" id="name" size=25
						placeholder="Enter name" onkeyup="validateName()" required
						autofocus /> <font color="orangered" size="+1"><tt>
								<b>*</b>
							</tt></font> <br> <span id="namelocation" style="color: red"></span> <br />

					</td>
				</tr>

				<tr>
					<td><label style="font-family: verdana;">Contact No:</label></td>
					<td><input type="tel" name="phoneNumber" id="phoneNumber"
						size=25 placeholder="Enter phoneNumber"
						onkeyup="validatePhoneNumber()" required autofocus maxlength="10"
						pattern="\d{10}" title="Please enter exactly 10 digits" /> <font
						color="orangered" size="+1"><tt>
								<b>*</b>
							</tt></font> <br> <span id="phoneNumberlocation" style="color: red"></span>
						<br /></td>
				</tr>

				<tr>
					<td><label style="font-family: verdana;">Password:</label></td>

					<td><input type="password" id="password" name="password"
						maxlength="15" min="8" size=25 placeholder="Enter password"
						onkeyup="validatePassword()" required /> <font color="orangered"
						size="+1"><tt>
								<b>*</b>
							</tt></font> <a
						href="javascript:window.open('passwordRules.jsp', 'Password Policy', 'width=200,height=150');">Password
							Policy</a> <input type="checkbox" onclick="myFunction()">Show
						Password <br /> <span id="passwordlocation" style="color: red"></span>
						<br /></td>
				</tr>

				<tr>
					<td><input type="submit" value="Register" id="myBtn" class="btn btn-success" /></td>

					<td><input type="reset" value="Reset" class="btn btn-danger"
						onclick="reset()"></td>
				</tr>
			</table>
</div>
		</form>
		</div>
</body>
</html>
