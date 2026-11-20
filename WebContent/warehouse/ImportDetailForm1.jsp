<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	WarehouseEmployee1 we = (WarehouseEmployee1) session.getAttribute("warehouseEmployee");
	if (we == null) { response.sendRedirect("../Login.jsp"); return; }
	ImportInvoice1 invoice = (ImportInvoice1) session.getAttribute("invoice");

	if (request.getParameter("btnPrintInvoice") != null) {
		// Bam "Luu va in hoa don"
		invoice.setCreatedDate(new Date());
		invoice.setPaymentDate(new Date());
		invoice.setStatus("Đã thanh toán");
		new ImportInvoiceDAO().saveImportInvoice(invoice);                 // 1. luu hoa don
		new ImportDetailDAO().saveImportDetails(invoice.getImportDetail()); // 2. luu chi tiet
		new SparePartDAO().increaseStock(invoice.getImportDetail());        // 3. cong ton kho
		session.removeAttribute("invoice");
%>
		<script>
			alert("Lưu hóa đơn nhập thành công!");
			window.print();
			location.href = "WarehouseMainForm1.jsp";
		</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Hóa đơn nhập phụ tùng - GaraMan</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<jsp:include page="/header.jsp" />
<div class="container">
	<h2>Hóa đơn nhập phụ tùng</h2>
	<div class="detail-box">
		<p><b>Nhân viên kho:</b> <%= we.getName() %></p>
		<p><b>Ngày lập:</b> <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></p>
		<p><b>Nhà cung cấp:</b> <%= invoice.getSupplier().getName() %> - <%= invoice.getSupplier().getAddress() %></p>
	</div>
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
	<form class="actions" action="ImportDetailForm1.jsp" method="post">
		<input type="submit" name="btnPrintInvoice" value="Lưu và in hóa đơn">
		<a class="btn btn-secondary" id="btnCancel" href="ImportInvoiceForm1.jsp">Hủy</a>
	</form>
</div>
</body>
</html>
