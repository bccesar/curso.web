<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="efetuaLogin" method="post">
<table border="0">
	<tr>
		<td>Login:</td>
		<td><input type="text" name="login"/></td>
	</tr>
	<tr>
		<td>Senha:</td>
		<td><input type="password" name="senha"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Entrar nas tarefas" /></td>
	</tr>
</table>
</form>
</body>
</html>