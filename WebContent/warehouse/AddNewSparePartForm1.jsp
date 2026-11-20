<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("warehouseEmployee") == null) { response.sendRedirect("../Login.jsp"); return; }

	if (request.getParameter("name") != null) {
		// Dong goi thong tin vua nhap thanh doi tuong SparePart1 roi luu
		SparePart1 sp = new SparePart1();
		sp.setName(request.getParameter("name"));
		sp.setType(request.getParameter("type"));
		sp.setBrand(request.getParameter("brand"));
		new SparePartDAO().saveNewSparePart(sp);

		// Chon luon phu tung vua them de nhap don gia, so luong
		session.setAttribute("sparePart", sp);
		response.sendRedirect("ImportInvoiceForm1.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Thêm phụ tùng mới - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container container-sm">
	<h2>Thêm phụ tùng mới</h2>
	<form action="AddNewSparePartForm1.jsp" method="post">
		<div class="form-group">
			<label for="name">Tên phụ tùng</label>
			<input type="text" id="name" name="name" required>
		</div>
		<div class="form-group">
			<label for="type">Loại</label>
			<input type="text" id="type" name="type">
		</div>
		<div class="form-group">
			<label for="brand">Thương hiệu</label>
			<input type="text" id="brand" name="brand">
		</div>
		<div class="actions">
			<input type="submit" value="Lưu">
			<a class="btn btn-secondary" href="ImportInvoiceForm1.jsp">Hủy</a>
		</div>
	</form>
</div>
</body>
</html>
