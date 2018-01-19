package br.com.caelum.jdbc.teste;

import java.util.Calendar;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TestaInsere {

	public static void main(String[] args) {

		Contato c = new Contato();
		c.setNome("Bruno");
		c.setEmail("bruno@caelum.com.br");
		c.setEndereco("Alameda dos Heliotropios, 800");
		c.setDataNascimento(Calendar.getInstance());
		
		ContatoDao dao = new ContatoDao();
		dao.adiciona(c);
		System.out.println("Gravado!");
		
		
	}

}
