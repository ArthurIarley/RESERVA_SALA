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

import web.dao.CursoDao;
import web.modelo.Curso;

@Transactional
@Controller
@RequestMapping("/curso")
public class CursoController {

	private List<Curso> lista_cursos;

	@Autowired
	CursoDao dao;

	@RequestMapping("/novo")
	public String curso() {
		return "curso/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Curso curso, BindingResult result) {
		if (result.hasErrors() || dao.buscaPorNome(curso.getNome()).size() > 0) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(curso);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_cursos = dao.lista();
		model.addAttribute("cursos", this.lista_cursos);
		return "curso/lista";
	}

	@RequestMapping("/remove")
	public String remove(Curso curso) {
		dao.remove(curso.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("curso", dao.buscaPorId(id));
		return "curso/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("curso", dao.buscaPorId(id));
		return "curso/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Curso curso, BindingResult result) {
		this.lista_cursos = dao.buscaPorNome(curso.getNome());
		if (result.hasErrors() || this.lista_cursos.size() > 0) {
			return "redirect:edita?id=" + curso.getId();
		}

		dao.altera(curso);
		return "redirect:lista";
	}

}
