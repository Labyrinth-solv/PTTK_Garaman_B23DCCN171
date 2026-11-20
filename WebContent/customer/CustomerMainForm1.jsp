<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	Member1 customer = (Member1) session.getAttribute("customer");
	if (customer == null) { response.sendRedirect("../Login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Trang khách hàng - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container container-sm">
	<h2>Xin chào khách hàng <%= customer.getName() %></h2>
	<div class="actions">
		<a class="btn" href="ServiceSearchForm1.jsp">Tìm kiếm thông tin dịch vụ</a>
	</div>
</div>
</body>
</html>
