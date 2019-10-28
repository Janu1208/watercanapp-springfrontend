<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">

</head>
<body style="text-align: center">

<div class="view" id="view">
        <%
            String pageName = request.getParameter("pageName");
            if (pageName == null || "".equals(pageName)) {
                pageName = "home.jsp";
            }
        %>

        <jsp:include page="<%=pageName%>"></jsp:include>
    </div>
</body>
</html>