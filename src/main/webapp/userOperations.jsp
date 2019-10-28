<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
</head>
<body style="text-align:center" font-color="pink">
<div class="img">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>
<div id="name"></div>
<div class="c"><a href="?pageName=availableCans.jsp">Available Cans</a><br></div>
<div class="c"><a href="?pageName=directOrder.jsp">Order Cans</a><br></div>
<div class="c"><a href="?pageName=reserveCans.jsp">Reserve Cans</a><br></div>
<div class="c"><a href="?pageName=reserveOrder.jsp">Order Reserved Cans</a><br></div>


<script>
function logout()
{
	localStorage.clear();
	location.href = "?pageName=index.jsp";

}
function displayName()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var name=user.name;
	document.getElementById("name").innerHTML="<h2>Welcome        " + name +"</h2>";
    return name;
}
displayName();
</script>
</div>
</body>

</html>