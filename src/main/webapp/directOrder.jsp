<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<link rel="styles" href="css/userOperations.css">
</head>
<body style="text-align: center" font-color="red">
<div class="img">
	<jsp:include page="userOpHeader.jsp"></jsp:include><br>
	<script type="text/javascript">
		function getUserId() {
			var user = JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
			var id = user.id;
			return id;
		}
	</script>
	<script type="text/javascript">
		function reset() {
			window.location.href = "?pageName=directOrder.jsp";
		}
		function orderCan() {
			console.log("inerfunction");
			event.preventDefault();
			var orderCans = document.getElementById("orderCans").value;
			var userId = getUserId();
			var formData = "userId=" + userId + "&orderCans=" + orderCans;
			var url = "http://localhost:9000/orderCan?" + formData;

			$.post(url).then(function(response) {
				var data = response;
				if (data != null) {
					alert("Sucessfully  ordered");
					window.location.href = "?pageName=userOperations.jsp";
				}
			}, function(response) {
				var data = response.responseJSON;
				if (data != null) {
					alert(data.message);
					window.location.href = "?pageName=directOrder.jsp";
				}
			});

		}
	</script>
	<div class="text-block">
	<div id="id"></div>
	<form onsubmit="orderCan()">
		<h1>Order Cans</h1>
		  <br /> How many cans you want to order?
		 <input type="number" name="orderCans" id="orderCans" placeholder="Enter no.of cans" min=1 pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;" required autofocus /><br> <br />
		 <input type="submit" value="Submit" class="btn btn-success"> 
		 <input type="button" value="Reset" class="btn btn-danger" onClick="reset()"> 
		 <input type="button" class="button" value="Back" class="btn btn-primary" onclick="history.go(-1);"><br></br> 
		 <tr>
         <a href="javascript:window.open('availCans.jsp', 'width=200,height=150');">Available Cans</a>   
           </tr>
           
	</form>
</div>
</div>
</body>
</html>