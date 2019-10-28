<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<script type="text/javascript">
function getUserId()
{
	var user=JSON.parse(localStorage.getItem("LOGGED_IN_USER"));
	var id=user.id;
    return id;
}
getUserId();
</script>

<script type="text/javascript">
function reset() {
	window.location.href = "?pageName=reserveCans.jsp";
}
function reserveCan()
{
	event.preventDefault();
	var reserveCans=document.getElementById("reserveCans").value;
	var  userId = getUserId();	
	var formData = "userId="+userId + "&reserveCans="+ reserveCans;
    var url = "http://localhost:9000/reserveCan?" + formData;
    $.post(url).then(function(response) {
	       var data = response;
	       console.log(data);
	       if (data != null) {
	    	   alert("Reserved successfully,Your Reserve Id is "+data);
		    	
	           window.location.href = "?pageName=userOperations.jsp";
	       }
	   },
	   function(response) {
	       var data =response;
	       console.log(data);
	       if (data.responseText!= null) {
	           alert(data.responseText);
	           window.location.href = "?pageName=reserveCans.jsp";
	       }
	   });

}

</script>
</head>
<body style="text-align: center" font-color="red">
<div class="img">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>


<div id="id"></div>

<form onsubmit="reserveCan()">
<div class="text-block">
<h1 >Reserve Cans</h1>
<br/>
<tr>
<td>
How many cans you want to Reserve?
</td>
<td>
<input type="number" name="reserveCans" id="reserveCans" placeholder="Enter no.of cans" min=1 pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==4) return false;" required autofocus   /><br>
</td>
<br/>
<input type="submit"  value="Submit" class="btn btn-success">

<input type="button"  value="Reset" class="btn btn-danger" onclick="reset()">
<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>
</tr>
 <a href="javascript:window.open('availCans.jsp', 'Password Policy', 'width=200,height=150');">Available Cans</a>							
</div>
</form>

</div>
</body>

</html>