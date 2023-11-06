package web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ServidorDao;
import web.modelo.Servidor;

@Transactional
@Controller
@RequestMapping("/servidor")
public class ServidorController {

	private List<Servidor> lista_servidors;

	@Autowired
	ServidorDao dao;

	@RequestMapping("/novo")
	public String servidor() {
		return "servidor/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Servidor servidor, BindingResult result) {
		if (result.hasErrors() || dao.buscaPorNome(servidor.getNome()).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(servidor);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_servidors = dao.lista();
		model.addAttribute("servidors", this.lista_servidors);
		return "servidor/lista";
	}

	@RequestMapping("/remove")
	public String remove(Servidor servidor) {
		dao.remove(servidor.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("servidor", dao.buscaPorId(id));
		return "servidor/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("servidor", dao.buscaPorId(id));
		return "servidor/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Servidor servidor, BindingResult result) {
		this.lista_servidors = dao.buscaPorNome(servidor.getNome());
		if (result.hasErrors() || this.lista_servidors.size() > 0) {
			return "redirect:edita?id=" + servidor.getId();
		}

		dao.altera(servidor);
		return "redirect:lista";
	}

}
