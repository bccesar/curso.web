package br.com.caelum.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;


@WebServlet("/adicionaContato")
public class AdicionaContatoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();
		
		//pegando os parametros
		Contato c = new Contato();
		c.setNome(req.getParameter("nome"));
		c.setEmail(req.getParameter("email"));
		c.setEndereco(req.getParameter("endereco"));
		Calendar dataNascimento = Calendar.getInstance();
		try {
			dataNascimento.setTime(new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("dataNascimento").toString()));
		} catch (ParseException e) {
			out.println("Erro ao converter data");
			throw new RuntimeException(e);
		}
		c.setDataNascimento(dataNascimento);
		
		Connection con = (Connection) req.getAttribute("conexao");
		ContatoDao dao = new ContatoDao(con);
		dao.adiciona(c);
		
		//out.println("<html><body>Contato " + c.getNome() + " adicionado com sucesso<br><a href=\"adiciona-contato.jsp\">adicionar novo</a><br><a href=\"lista-contatos.jsp\">listar contatos</a></body></html>" );
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/contato-adicionado.jsp");
		rd.forward(req, resp);
		
	
	}
	
	
}
