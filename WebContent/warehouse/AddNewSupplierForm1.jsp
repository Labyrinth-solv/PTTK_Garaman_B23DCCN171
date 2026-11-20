<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("warehouseEmployee") == null) { response.sendRedirect("../Login.jsp"); return; }

	if (request.getParameter("btnSave") != null) {
		// Dong goi thong tin vua nhap thanh doi tuong Supplier1 roi luu
		Supplier1 supplier = new Supplier1();
		supplier.setName(request.getParameter("inName"));
		supplier.setAddress(request.getParameter("inAddress"));
		supplier.setPhoneNumber(request.getParameter("inPhoneNumber"));
		supplier.setEmail(request.getParameter("inEmail"));
		new SupplierDAO().saveNewSupplier(supplier);

		// Chon luon nha cung cap vua them cho hoa don dang lap
		ImportInvoice1 invoice = (ImportInvoice1) session.getAttribute("invoice");
		invoice.setSupplier(supplier);
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
			<label for="inName">Tên</label>
			<input type="text" id="inName" name="inName" required>
		</div>
		<div class="form-group">
			<label for="inAddress">Địa chỉ</label>
			<input type="text" id="inAddress" name="inAddress">
		</div>
		<div class="form-group">
			<label for="inPhoneNumber">Điện thoại</label>
			<input type="text" id="inPhoneNumber" name="inPhoneNumber">
		</div>
		<div class="form-group">
			<label for="inEmail">Email</label>
			<input type="text" id="inEmail" name="inEmail">
		</div>
		<div class="actions">
			<input type="submit" name="btnSave" value="Lưu">
			<a class="btn btn-secondary" id="btnCancel" href="ImportInvoiceForm1.jsp">Hủy</a>
		</div>
	</form>
</div>
</body>
</html>
