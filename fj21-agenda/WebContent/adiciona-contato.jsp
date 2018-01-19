<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<link href="css/jquery.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<title>Adiciona Contato</title>
</head>
<body>
<c:import url="cabecalho.jsp" />
<c:import url="menu.jsp" />
<h2>Incluir Contato</h2>
<form action="adicionaContato" method="post">
	<table>
		<tr>
			<td>Nome:</td>
			<td><input type="text" name="nome" /></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td>EndereÃ§o:</td>
			<td><input type="text" name="endereco" /></td>
		</tr>
		<tr>
			<td>Data de Nascimento:</td>
			<td><caelum:campoData id="dataNascimento" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Gravar" /></td>
		</tr>
	</table>
</form>

<c:import url="rodape.jsp" />
</body>
</html>