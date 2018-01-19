<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Tarefa</title>
</head>
<body>
<h3>Alterar tarefa - ${tarefa.id}</h3>
<form action="alteraTarefa" method="post">
	<input type="hidden" name="id" value="${tarefa.id }" />
	Descrição:<br>
	<textarea rows="6" cols="100" name="descricao">${tarefa.descricao }</textarea>
	<br>
	Finalizado?:<br>
	<input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? ' checked': '' } /><br>
	Data finalizacao:<br>
	<caelum:campoData id="dataFinalizacao" value="${tarefa.dataFinalizacao.time}" />
	<br	/>
	<input type="submit" value="Alterar"/>
</form>
</body>
</html>