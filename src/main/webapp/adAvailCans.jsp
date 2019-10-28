<!DOCTYPE html>
<html>

<head>
<title>UsersList</title>

</head>
<body>
<div class="img">
<jsp:include page="adminOpHeader.jsp"></jsp:include><br>
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
	window.location.href= "?pageName=adminOperations.jsp";
}
</script>
<div class="text-block">
    <div id="stock-section">
        <table border="1" class="table table-condensed">
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
<input type="button" class ="button" value="Back" onclick="history.go(-1);"><br></br>
</div>
</div>
</body>
</html>
