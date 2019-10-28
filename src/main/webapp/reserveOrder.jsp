<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>

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
	function orderCan()
	{
		event.preventDefault();
		var reserveId=document.getElementById("reserveId").value;
		var  userId = getUserId();
		var formData = "userId="+userId + "&reserveId="+ reserveId;
	    var url = "http://localhost:9000/orderReservedCan?" + formData;
	    		
	    $.post(url).then(function(response) {
		       var data = response;
		       console.log(data);
		       if (data != null) {
		           alert("your reserved cans are ordered Succesfully");
		           window.location.href = "?pageName=userOperations.jsp";
		       }
		   },
		   function(response) {
		       var data =response;
		       console.log(data);
		       if (data.responseText!= null) {
		           alert("Invalid reserveId");
		           window.location.href = "?pageName=reserveOrder.jsp";
		       }
		   });				
	}
	
	</script>
	<form onsubmit="orderCan()">
	<div class="text-block">
		<h1>Order Reserved Cans</h1>
		<label>Enter your reserve id</label> <input type="number"
			id="reserveId" name="reserveId" min=1 pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;" required autofocus><br>
		<p>Do you want to order the reserved cans?</p>
		<input type="submit" value="Submit" class="btn btn-success"> <input
			type="submit" value="Cancel" class="btn btn-danger"
			onclick="window.location.href ='?pageName=reserveOrder.jsp">
		<input type="button" value="Modify" class="btn btn-primary"
			onclick="window.location.href ='?pageName=modifyOrder.jsp'">
		<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>
		</div>	
	</form>
</div>
</body>
</html>