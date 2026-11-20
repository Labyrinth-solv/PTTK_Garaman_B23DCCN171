<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if (session.getAttribute("warehouseEmployee") == null) { response.sendRedirect("../Login.jsp"); return; }

	if (request.getParameter("btnSave") != null) {
		// Dong goi thong tin vua nhap thanh doi tuong SparePart1 roi luu
		SparePart1 sp = new SparePart1();
		sp.setName(request.getParameter("inName"));
		sp.setType(request.getParameter("inType"));
		sp.setBrand(request.getParameter("inBrand"));
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
<jsp:include page="/header.jsp" />
<div class="container container-sm">
	<h2>Thêm phụ tùng mới</h2>
	<form action="AddNewSparePartForm1.jsp" method="post">
		<div class="form-group">
			<label for="inName">Tên phụ tùng</label>
			<input type="text" id="inName" name="inName" required>
		</div>
		<div class="form-group">
			<label for="inType">Loại</label>
			<input type="text" id="inType" name="inType">
		</div>
		<div class="form-group">
			<label for="inBrand">Thương hiệu</label>
			<input type="text" id="inBrand" name="inBrand">
		</div>
		<div class="actions">
			<input type="submit" name="btnSave" value="Lưu">
			<a class="btn btn-secondary" id="btnCancel" href="ImportInvoiceForm1.jsp">Hủy</a>
		</div>
	</form>
</div>
</body>
</html>
