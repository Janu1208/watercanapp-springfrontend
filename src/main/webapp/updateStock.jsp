<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
</head>
<body>
<jsp:include page="adminOpHeader.jsp"></jsp:include><br>
<div class="img">
<script type="text/javascript">
function reset()
{
	window.location.href = "?pageName=updateStock.jsp";

}

function updatestock()
{
	event.preventDefault();
	
	var addCans = document.getElementById("addCans").value;
	var formData = "addCans=" +addCans;

    var url = "http://localhost:9000/updateStock?" + formData;
    console.log(url);
    $.post(url).then(function(response) {
    	console.log(response);
		var data = response;
		console.log(data);
		if (data != null) {
			alert("Cans added succesfully");
			window.location.href = "?pageName=adminOperations.jsp";
		}
	}, function(response) {
		var data = response.responseJSON;
		console.log(data);
		if (data!= null) {
			alert(data.message);
			window.location.href = "?pageName=updateStock.jsp";
		}
	});
}
</script>
<div class="text-block">
<form onsubmit="updatestock()">

Set Available Cans: 
<input type="number" id="addCans" name="addCans" placeholder="Enter the cans" min=1 maxLength=4 required autofocus  /> <br>
<br/>
<input type="submit"  value="Submit" class="btn btn-success">
<button type="reset"  value="Reset" class="btn btn-danger" >Clear</button>
<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>

</form>
</div>
</div>
</body>
</html>