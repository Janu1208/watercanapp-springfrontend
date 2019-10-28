<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<title>Reserve List</title>
</head>
<body style="text-align:center" font-color="pink">
<div class="img">
<jsp:include page="userOpHeader.jsp"></jsp:include><br>
<script type="text/javascript">
function View()
{
    var url = "http://localhost:9000/viewStock";
    $.getJSON(url, function(response){
    	console.log(response);
        var data = response;
        var content="";

        document.getElementById("reserve").innerHTML="";
        for(let reserve of data)
        {
            content += "<tr>";
            content += "<td>" + reserve.reserveId + "</td>";
            content += "<td>" + reserve.reservedCans+"</td>";
            content += "<td>" + reserve.status+"</td>";
            content += "</tr>";
        }
        document.getElementById("reserve").innerHTML = content;
    });
}
function back()
{
	window.location.href= "?pageName=userOperations.jsp";
}
</script>
<div class="text-block">
    <div id="reserve-section">
    <h2 style="color: DARKVIOLET;">Reserved Details</h2><br/>
    <br/>
        <table border="1" class="table table-condensed" width="100">
        
            <thead>
                <tr>
                    <th>Reserve Id</th>
                    <th>Reserved Cans</th>
                    <th>status</th>
                </tr>
            </thead>
            <tbody id="reserve">
            </tbody>
        </table>
    </div>
    <script>
View();
</script>
<input type="button" class ="btn btn-danger" value="Back" onclick="history.go(-1);"><br></br>
</div>
</div>
</body>
</html>