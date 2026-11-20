<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("warehouseEmployee") == null) { response.sendRedirect("../Login.jsp"); return; }

	if (request.getParameter("name") != null) {
		// Dong goi thong tin vua nhap thanh doi tuong Supplier1 roi luu
		Supplier1 s = new Supplier1();
		s.setName(request.getParameter("name"));
		s.setAddress(request.getParameter("address"));
		s.setPhoneNumber(request.getParameter("phoneNumber"));
		s.setEmail(request.getParameter("email"));
		new SupplierDAO().saveNewSupplier(s);

		// Chon luon nha cung cap vua them cho hoa don dang lap
		ImportInvoice1 invoice = (ImportInvoice1) session.getAttribute("invoice");
		invoice.setSupplier(s);
		response.sendRedirect("ImportInvoiceForm1.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Thêm nhà cung cấp mới - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container container-sm">
	<h2>Thêm nhà cung cấp mới</h2>
	<form action="AddNewSupplierForm1.jsp" method="post">
		<div class="form-group">
			<label for="name">Tên</label>
			<input type="text" id="name" name="name" required>
		</div>
		<div class="form-group">
			<label for="address">Địa chỉ</label>
			<input type="text" id="address" name="address">
		</div>
		<div class="form-group">
			<label for="phoneNumber">Điện thoại</label>
			<input type="text" id="phoneNumber" name="phoneNumber">
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<input type="text" id="email" name="email">
		</div>
		<div class="actions">
			<input type="submit" value="Lưu">
			<a class="btn btn-secondary" href="ImportInvoiceForm1.jsp">Hủy</a>
		</div>
	</form>
</div>
</body>
</html>
