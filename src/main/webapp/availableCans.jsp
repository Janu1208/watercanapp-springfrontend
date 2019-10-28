<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<head>
<title>UsersList</title>
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

        document.getElementById("stock").innerHTML="";
        for(let stock of data)
        {
            content += "<tr>";
            content += "<td>" + stock.cansAvail + "</td>";
            content += "<td>" + stock.date+"</td>";
            content += "</tr>";
        }
        document.getElementById("stock").innerHTML = content;
    });
}
function back()
{
	window.location.href= "?pageName=userOperations.jsp";
}
</script>
<div class="text-block">
    <div id="stock-section">
    <h2 style="color: DARKVIOLET;">Available Stock</h2><br/>
    <br/>
        <table border="1" class="table table-condensed" width="100">
        
            <thead>
                <tr>
                    <th>Available Cans</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody id="stock">
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