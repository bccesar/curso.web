package br.com.caelum.mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdicionaContatoLogic implements Logica{

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) {
		return "adiciona-contato.jsp";
			
	
	}

}
