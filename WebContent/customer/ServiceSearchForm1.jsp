<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("customer") == null) { response.sendRedirect("../Login.jsp"); return; }

	String key = request.getParameter("key");
	ArrayList<Service1> services = new ArrayList<>();
	ArrayList<SparePart1> spareParts = new ArrayList<>();
	if (key != null) {
		// Bam "Tim kiem": goi 2 DAO tim dich vu va phu tung theo ten
		services = new ServiceDAO1().getServicesByName(key);
		spareParts = new SparePartDAO1().getSparePartsByName(key);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tìm kiếm dịch vụ - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container">
	<h2>Tìm kiếm thông tin dịch vụ</h2>
	<form class="form-inline" action="ServiceSearchForm1.jsp" method="get">
		<input type="text" name="key" placeholder="Nhập tên dịch vụ hoặc phụ tùng..." value="<%= key == null ? "" : key %>">
		<input type="submit" value="Tìm kiếm">
	</form>

	<% if (key != null && services.isEmpty() && spareParts.isEmpty()) { %>
		<p class="empty">Không tìm thấy dịch vụ/phụ tùng phù hợp</p>
	<% } else if (key != null) { %>
	<table>
		<thead>
			<tr><th>Tên</th><th>Loại</th><th>Đối tượng áp dụng / Thương hiệu</th><th>Giá</th></tr>
		</thead>
		<tbody>
		<% for (Service1 s : services) { %>
			<tr>
				<td><a href="ServiceDetailForm1.jsp?id=<%= s.getId() %>"><%= s.getName() %></a></td>
				<td>Dịch vụ</td>
				<td><%= s.getTargetVehicle() %></td>
				<td><%= s.getPrice() %></td>
			</tr>
		<% } %>
		<% for (SparePart1 sp : spareParts) { %>
			<tr>
				<td><a href="SparePartDetailForm1.jsp?id=<%= sp.getId() %>"><%= sp.getName() %></a></td>
				<td>Phụ tùng</td>
				<td><%= sp.getBrand() %></td>
				<td><%= sp.getSellingPrice() %></td>
			</tr>
		<% } %>
		</tbody>
	</table>
	<% } %>
	<div class="actions">
		<a class="btn btn-secondary" href="CustomerMainForm1.jsp">Về trang chủ</a>
	</div>
</div>
</body>
</html>
