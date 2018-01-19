<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Tarefa</title>
</head>
<body>
<script	type="text/javascript">
function finalizaAgora(id) {
	$.post("finalizaTarefa", {'id' : id}, function(){
		$("#tarefa_"+id).html("<b>sim</b>");
	});
}
</script>
<h3>Lista Tarefas</h3>
<a href="novaTarefa">Criar	nova tarefa</a>	
<br/><br/>		
<form action="" method="post">
<table border="1">
	<tr>
		<td>id</td>
		<td>descricao</td>
		<td>finalizada</td>
		<td>data finalização</td>
		<td>Remover</td>
		<td>Alterar</td>
	</tr>
	<c:forEach var="tarefa" items="${tarefas }">
		<tr>
			<td>${tarefa.id }</td>
			<td>${tarefa.descricao }</td>
			<td id="tarefa_${tarefa.id}">
				<c:if test="${tarefa.finalizado eq false }">
					não <a href="#"	onClick="finalizaAgora(${tarefa.id})">[finalizar]</a>
				</c:if>
				<c:if test="${tarefa.finalizado eq true }">
					sim
				</c:if>
			</td>
			<td>
				<fmt:formatDate value="${tarefa.dataFinalizacao.time }" pattern="dd/MM/yyyy"/>
			</td>
			<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
			<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
		</tr>
	</c:forEach>
</table>
</form>

</body>
</html>