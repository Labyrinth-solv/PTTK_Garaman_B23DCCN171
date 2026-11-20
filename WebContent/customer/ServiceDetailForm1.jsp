<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	if (session.getAttribute("customer") == null) { response.sendRedirect("../Login.jsp"); return; }

	int idService = Integer.parseInt(request.getParameter("id"));
	Service1 s = new ServiceDAO1().getServiceDetail(idService);
	ArrayList<SparePartPerService1> parts = new SparePartPerServiceDAO1().getSparePartsByService(idService);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Chi tiết dịch vụ - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
	<h2>Chi tiết dịch vụ</h2>
	<div class="detail-box" id="tblService">
		<p><b>Tên:</b> <%= s.getName() %></p>
		<p><b>Loại dịch vụ:</b> <%= s.getType() %></p>
		<p><b>Mô tả:</b> <%= s.getDescription() %></p>
		<p><b>Đơn giá:</b> <%= s.getPrice() %> VNĐ</p>
		<p><b>Thời gian thực hiện:</b> <%= (int) s.getDuration() %> phút</p>
		<p><b>Đối tượng áp dụng:</b> <%= s.getTargetVehicle() %></p>
		<p><b>Phụ tùng sử dụng:</b></p>
		<ul>
			<% for (SparePartPerService1 p : parts) { %>
			<li>
				<a href="SparePartDetailForm1.jsp?id=<%= p.getSparePart().getId() %>"><%= p.getSparePart().getName() %></a>
				(số lượng: <%= p.getQuantity() %>)
			</li>
			<% } %>
		</ul>
	</div>
	<div class="actions">
		<a class="btn btn-secondary" id="btnCancel" href="javascript:history.back()">Quay lại</a>
	</div>
</div>
</body>
</html>
