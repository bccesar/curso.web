package br.com.caelum.tarefas.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefaController {

	
	private final JdbcTarefaDao dao;	
	
	@Autowired
	private TarefaController(JdbcTarefaDao dao){
		this.dao = dao;
	}
	
	
	@RequestMapping("novaTarefa")
	public String form(Tarefa tarefa){
		return "tarefa/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult br){
		
		
		if(br.hasFieldErrors("descricao"))	{
			return	"tarefa/formulario";
		}				
		
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model){
		
		model.addAttribute("tarefas", dao.lista());
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa){
		
		dao.remove(tarefa);
		
		//return "tarefa/lista"; 			//esse nao vai funcionar, pq aqui já ta indo para o jsp, mas nao carregamos a lista para ele
		//return "forward:listaTarefas"; 	//esse é uma opcao do lado servidor, o spring entende que queremos chamar o metodo listaTarefas
		return "redirect:listaTarefas";		//esse é uma opcao do lado client, o spring entende que queremos redirecionar lá pelo client
		
		//OBS: pelo server, fica a url do delete, pelo client fica a url da lista no final
		
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model){
		
		model.addAttribute("tarefa", dao.buscaPorId(id));
		
		return "tarefa/mostra";
	}
	
	
	@RequestMapping("alteraTarefa")
	public String altera(Tarefa	tarefa){
		
		dao.altera(tarefa);

		return "redirect:listaTarefas";
	}
	
	@ResponseBody
	@RequestMapping("finalizaTarefa")
	public void finaliza(Long id){
		
		dao.finaliza(id);
	}
}
