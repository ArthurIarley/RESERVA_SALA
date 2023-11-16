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

import web.dao.SolicitacaoDao;
import web.modelo.Solicitacao;

@Transactional
@Controller
@RequestMapping("/solicitacao")
public class SolicitacaoController {

	private List<Solicitacao> lista_solicitacaos;

	@Autowired
	SolicitacaoDao dao;

	@RequestMapping("/novo")
	public String solicitacao() {
		return "solicitacao/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Solicitacao solicitacao, BindingResult result) {
		if (result.hasErrors() ) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(solicitacao);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_solicitacaos = dao.lista();
		model.addAttribute("solicitacaos", this.lista_solicitacaos);
		return "solicitacao/lista";
	}

	@RequestMapping("/remove")
	public String remove(Solicitacao solicitacao) {
		dao.remove(solicitacao.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("solicitacao", dao.buscaPorId(id));
		return "solicitacao/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("solicitacao", dao.buscaPorId(id));
		return "solicitacao/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Solicitacao solicitacao, BindingResult result) {
	if (result.hasErrors() ) {
			return "redirect:edita?id=" + solicitacao.getId();
		}

		dao.altera(solicitacao);
		return "redirect:lista";
	}

}
