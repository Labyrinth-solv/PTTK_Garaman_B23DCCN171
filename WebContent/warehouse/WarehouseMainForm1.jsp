<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	WarehouseEmployee1 we = (WarehouseEmployee1) session.getAttribute("warehouseEmployee");
	if (we == null) { response.sendRedirect("../Login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Trang nhân viên kho - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container container-sm">
	<h2>Xin chào nhân viên kho <%= we.getName() %></h2>
	<div class="actions">
		<a class="btn" href="ImportInvoiceForm1.jsp?action=new">Nhập phụ tùng</a>
	</div>
</div>
</body>
</html>
