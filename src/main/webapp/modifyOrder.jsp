<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="text-align: center">
<div class="img">
	<jsp:include page="userOpHeader.jsp"></jsp:include><br>
<script type="text/javascript">
function getUserId()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var id=user.id;
    return id;
}
function canOrder()
{
	 event.preventDefault();
var reserveId=document.getElementById("reserveId").value;
var modifiedCans = document.getElementById("modifiedCans").value;
var  userId = getUserId();
var formData = "modifiedCans=" + modifiedCans+"&userId="+userId + "&reserveId="+reserveId;
var url = "http://localhost:9000/orderModifiedReservedCan?" + formData;
var formData = {};
$.post(url).then(function(response) {
    var data = response;
    console.log(data);
    if (data!= null) {
        alert("Ordered Succesfully");
        window.location.href = "?pageName=userOperations.jsp";
    }
},
function(error) {
    var data =error.responseJSON.message;
    console.log(data);
        alert("Please enter valid details and try again");
        window.location.href = "?pageName=modifyOrder.jsp";
});		
}
</script>
<form onsubmit="canOrder()">	
<div class="text-block">
<h1 style="color: DARKVIOLET;">Modify Order</h1>
<br/>
<label>Enter your reserve id</label> 
        <input type="number" id="reserveId" name="reserveId" pattern="/^-?\d+\.?\d*$/" min=1 pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;" required autofocus><br>
		<br />Enter number of cans: 
		<input type="number" id="modifiedCans" name="modifiedCans" min=1 pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;" required><br>
		<br/>
		<input type="submit" value="Submit" class="btn btn-success">
		<input type="button" value="Cancel" onclick="window.location.href ='?pageName=userOperations.jsp'" class="btn btn-danger"> 
</div>
</form>

</div>
</body>
</html>