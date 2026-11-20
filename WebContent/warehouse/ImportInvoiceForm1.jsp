<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	WarehouseEmployee1 we = (WarehouseEmployee1) session.getAttribute("warehouseEmployee");
	if (we == null) { response.sendRedirect("../Login.jsp"); return; }

	String action = request.getParameter("action");
	if ("new".equals(action)) {
		// Bat dau 1 hoa don nhap moi, luu trong session
		ImportInvoice1 newInvoice = new ImportInvoice1();
		newInvoice.setWarehouseEmployee(we);
		session.setAttribute("invoice", newInvoice);
		session.removeAttribute("sparePart");
	}
	ImportInvoice1 invoice = (ImportInvoice1) session.getAttribute("invoice");
	ArrayList<Supplier1> suppliers = (ArrayList<Supplier1>) session.getAttribute("suppliers");
	ArrayList<SparePart1> spareParts = (ArrayList<SparePart1>) session.getAttribute("spareParts");
	SparePart1 sparePart = (SparePart1) session.getAttribute("sparePart"); // phu tung dang chon
	String msg = "";

	if ("searchSupplier".equals(action)) {
		suppliers = new SupplierDAO().getSupplierByName(request.getParameter("key"));
		session.setAttribute("suppliers", suppliers);
	}
	if ("chooseSupplier".equals(action)) {
		int i = Integer.parseInt(request.getParameter("index"));
		invoice.setSupplier(suppliers.get(i));
	}
	if ("searchSparePart".equals(action)) {
		spareParts = new SparePartDAO().getSparePartByName(request.getParameter("key"));
		session.setAttribute("spareParts", spareParts);
	}
	if ("chooseSparePart".equals(action)) {
		int i = Integer.parseInt(request.getParameter("index"));
		sparePart = spareParts.get(i);
		session.setAttribute("sparePart", sparePart);
	}
	if ("addDetail".equals(action)) {
		// Dong goi 1 dong chi tiet: phu tung dang chon + don gia + so luong
		ImportDetail1 d = new ImportDetail1();
		d.setSparePart(sparePart);
		d.setImportPrice(Float.parseFloat(request.getParameter("price")));
		d.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		d.setImportInvoice(invoice);
		invoice.getImportDetail().add(d);
		session.removeAttribute("sparePart");
		sparePart = null;
	}
	if ("confirm".equals(action)) {
		if (invoice.getSupplier() == null) {
			msg = "Cần chọn nhà cung cấp!";
		} else if (invoice.getImportDetail().isEmpty()) {
			msg = "Cần nhập ít nhất một phụ tùng!";
		} else {
			response.sendRedirect("ImportDetailForm1.jsp");
			return;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Nhập phụ tùng - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
	<h2>Nhập phụ tùng</h2>
	<% if (!msg.isEmpty()) { %>
		<p class="error"><%= msg %></p>
	<% } %>

	<div class="section">
		<h3>1. Nhà cung cấp: <%= invoice.getSupplier() == null ? "(chưa chọn)" : invoice.getSupplier().getName() %></h3>
		<form class="form-inline" action="ImportInvoiceForm1.jsp" method="post">
			<input type="hidden" name="action" value="searchSupplier">
			<input type="text" name="key" placeholder="Tìm nhà cung cấp...">
			<input type="submit" value="Tìm">
			<a class="btn btn-secondary" href="AddNewSupplierForm1.jsp">NCC mới</a>
		</form>
		<% if (suppliers != null) { %>
		<table>
			<thead>
				<tr><th>Tên</th><th>Địa chỉ</th><th>Điện thoại</th><th></th></tr>
			</thead>
			<tbody>
			<% for (int i = 0; i < suppliers.size(); i++) { %>
				<tr>
					<td><%= suppliers.get(i).getName() %></td>
					<td><%= suppliers.get(i).getAddress() %></td>
					<td><%= suppliers.get(i).getPhoneNumber() %></td>
					<td><a href="ImportInvoiceForm1.jsp?action=chooseSupplier&index=<%= i %>">Chọn</a></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<% } %>
	</div>

	<div class="section">
		<h3>2. Phụ tùng</h3>
		<form class="form-inline" action="ImportInvoiceForm1.jsp" method="post">
			<input type="hidden" name="action" value="searchSparePart">
			<input type="text" name="key" placeholder="Tìm phụ tùng...">
			<input type="submit" value="Tìm">
			<a class="btn btn-secondary" href="AddNewSparePartForm1.jsp">Phụ tùng mới</a>
		</form>
		<% if (spareParts != null) { %>
		<table>
			<thead>
				<tr><th>Tên</th><th>Thương hiệu</th><th>Tồn kho</th><th></th></tr>
			</thead>
			<tbody>
			<% for (int i = 0; i < spareParts.size(); i++) { %>
				<tr>
					<td><%= spareParts.get(i).getName() %></td>
					<td><%= spareParts.get(i).getBrand() %></td>
					<td><%= spareParts.get(i).getStock() %></td>
					<td><a href="ImportInvoiceForm1.jsp?action=chooseSparePart&index=<%= i %>">Chọn</a></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<% } %>
		<% if (sparePart != null) { %>
		<form class="form-inline detail-box" action="ImportInvoiceForm1.jsp" method="post">
			<input type="hidden" name="action" value="addDetail">
			<span>Phụ tùng: <b><%= sparePart.getName() %></b></span>
			<input type="number" name="price" min="1" placeholder="Đơn giá nhập" required>
			<input type="number" name="quantity" min="1" placeholder="Số lượng" required>
			<input type="submit" value="Thêm vào hóa đơn">
		</form>
		<% } %>
	</div>

	<div class="section">
		<h3>3. Hóa đơn nhập</h3>
		<table>
			<thead>
				<tr><th>Tên phụ tùng</th><th>Đơn giá</th><th>Số lượng</th><th>Thành tiền</th></tr>
			</thead>
			<tbody>
			<% float total = 0;
			   for (ImportDetail1 d : invoice.getImportDetail()) {
				   total += d.getImportPrice() * d.getQuantity(); %>
				<tr>
					<td><%= d.getSparePart().getName() %></td>
					<td><%= d.getImportPrice() %></td>
					<td><%= d.getQuantity() %></td>
					<td><%= d.getImportPrice() * d.getQuantity() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<p class="total">Tổng tiền: <b><%= total %></b> VNĐ</p>
	</div>

	<div class="actions">
		<a class="btn" href="ImportInvoiceForm1.jsp?action=confirm">Xác nhận hóa đơn</a>
		<a class="btn btn-secondary" href="WarehouseMainForm1.jsp">Hủy</a>
	</div>
</div>
</body>
</html>
