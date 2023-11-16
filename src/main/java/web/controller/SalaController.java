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

import web.dao.SalaDao;
import web.dao.ServidorDao;
import web.modelo.Sala;

@Transactional
@Controller
@RequestMapping("/sala")
public class SalaController {

	private List<Sala> lista_salas;

	@Autowired
	SalaDao dao;
	
	@Autowired
	ServidorDao dao_servidor;

	@RequestMapping("/novo")
	public String sala(Model model) {
		model.addAttribute("servidores", dao_servidor.lista());
		return "sala/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Sala sala, BindingResult result) {
		if (result.hasErrors() || dao.buscaPorNomeAdiciona(sala).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(sala);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_salas = dao.lista();
		model.addAttribute("salas", this.lista_salas);
		return "sala/lista";
	}

	@RequestMapping("/remove")
	public String remove(Sala sala) {
		dao.remove(sala.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("sala", dao.buscaPorId(id));
		return "sala/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("sala", dao.buscaPorId(id));
		model.addAttribute("servidores", dao_servidor.lista());
		return "sala/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Sala sala, BindingResult result) {
		this.lista_salas = dao.buscaPorNomeEdita(sala);
		if (result.hasErrors() || (this.lista_salas.size() > 0)) {
			return "redirect:edita?id=" + sala.getId();
		}

		dao.altera(sala);
		return "redirect:lista";
	}

}

