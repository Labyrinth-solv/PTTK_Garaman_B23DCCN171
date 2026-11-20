<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	Member1 m = new MemberDAO1().checkLogin(request.getParameter("username"),
			request.getParameter("password"));

	if (m == null) {
		response.sendRedirect("Login.jsp?err=1");          // sai tai khoan
	} else if (m instanceof WarehouseEmployee1) {
		session.setAttribute("warehouseEmployee", m);      // nhan vien kho
		response.sendRedirect("warehouse/WarehouseMainForm1.jsp");
	} else {
		session.setAttribute("customer", m);               // khach hang
		response.sendRedirect("customer/CustomerMainForm1.jsp");
	}
%>
