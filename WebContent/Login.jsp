<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập - GaraMan</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container container-sm">
	<h2>Đăng nhập</h2>
	<% if (request.getParameter("err") != null) { %>
		<p class="error">Sai tên đăng nhập hoặc mật khẩu!</p>
	<% } %>
	<form action="doLogin.jsp" method="post">
		<div class="form-group">
			<label for="username">Tên đăng nhập</label>
			<input type="text" id="username" name="username" required>
		</div>
		<div class="form-group">
			<label for="password">Mật khẩu</label>
			<input type="password" id="password" name="password" required>
		</div>
		<div class="actions">
			<input type="submit" value="Đăng nhập">
		</div>
	</form>
</div>
</body>
</html>
