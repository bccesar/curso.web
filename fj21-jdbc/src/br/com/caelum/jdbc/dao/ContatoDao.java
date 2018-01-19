package br.com.caelum.jdbc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.jdbc.ConnectionFactory;
import br.com.caelum.jdbc.modelo.Contato;

public class ContatoDao {

	private Connection connection;
	
	public ContatoDao(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Contato c){
		
		String sql = "insert into contatos (nome, email, endereco, dataNascimento) values (?, ?, ?, ?)";
		
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, c.getNome());
			stmt.setString(2, c.getEmail());
			stmt.setString(3, c.getEndereco());
			stmt.setDate(4, new Date(c.getDataNascimento().getTimeInMillis()));
			
			stmt.execute();
			stmt.close();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public List<Contato> getLista(){
		
		String sql = "select * from contatos;";
		
		try {
			PreparedStatement ps;
			ps = connection.prepareStatement(sql);
			ps.execute();
			ResultSet rs = ps.getResultSet();
			
			
			
			List<Contato> contatos = new ArrayList<Contato>();
			while(rs.next()){
				Contato c = new Contato();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setEmail(rs.getString("email"));
				c.setEndereco(rs.getString("endereco"));
				Calendar d = Calendar.getInstance();
				d.setTime(rs.getDate("dataNascimento"));
				c.setDataNascimento(d);
				
				contatos.add(c);
			}
			
			rs.close();
			ps.close();
			
			return contatos;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		
		
		
		
		
	}
	
}
