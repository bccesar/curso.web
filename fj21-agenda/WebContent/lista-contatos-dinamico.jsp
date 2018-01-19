<%@page import="br.com.caelum.agenda.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="br.com.caelum.agenda.modelo.Contato"%>
<%@page import="java.util.List"%>
<%@page import="br.com.caelum.agenda.dao.ContatoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Contatos</title>
</head>
<body>

<h3>Lista de Contatos</h3>


<%
	Connection con = new ConnectionFactory().getConnection();
	ContatoDao dao = new ContatoDao(con);
	List<Contato> lista = dao.getLista();
	
	
	
	Class<Contato> classe = Contato.class;
	Field fieldlist[] = classe.getDeclaredFields();
%>
<p>total listado: <%= lista.size() %> registros</p>
<table border="1">
	<tr>
		<%for (Field atributo : fieldlist) {%>
			  <td style="font-weight: bold"><%= atributo.getName() %></td>      
		<%}%>
	</tr>
	<%
		for(Contato c: lista){
	%>

	
	<tr>
		<td><%= c.getId() %></td>
		<td><%= c.getNome() %></td>
		<td><%= c.getEmail() %></td>
		<td><%= c.getEndereco() %></td>
		<td>
			<%
				SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
				out.println(f.format(c.getDataNascimento().getTime())) ;
			%>
		</td>
	</tr>
	
	<%
		}
	%>
	
	
	
</table>
</body>
</html>