<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	if (session.getAttribute("customer") == null) { response.sendRedirect("../Login.jsp"); return; }

	int id = Integer.parseInt(request.getParameter("id"));
	SparePart1 sp = new SparePartDAO1().getSparePartDetail(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Chi tiết phụ tùng - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
	<h2>Chi tiết phụ tùng</h2>
	<div class="detail-box">
		<p><b>Tên:</b> <%= sp.getName() %></p>
		<p><b>Loại phụ tùng:</b> <%= sp.getType() %></p>
		<p><b>Thương hiệu:</b> <%= sp.getBrand() %></p>
		<p><b>Xuất xứ:</b> <%= sp.getOrigin() %></p>
		<p><b>Giá bán:</b> <%= sp.getSellingPrice() %> VNĐ</p>
		<p><b>Số lượng tồn kho:</b> <%= sp.getStock() %></p>
		<p><b>Bảo hành:</b> <%= sp.getWarrantyPeriod() %> tháng</p>
		<p><b>Mô tả:</b> <%= sp.getDescription() %></p>
	</div>
	<div class="actions">
		<a class="btn btn-secondary" href="javascript:history.back()">Quay lại</a>
	</div>
</div>
</body>
</html>
