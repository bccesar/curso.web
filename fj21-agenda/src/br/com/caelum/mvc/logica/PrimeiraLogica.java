package br.com.caelum.mvc.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrimeiraLogica implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) {
		
		System.out.println("Executandi primeira logica");
		System.out.println("retornando o nome da pagina");
		return "primeira-logica.jsp";
		
	}

}
