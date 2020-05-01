package edu.unoesc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.unoesc.model.Pessoa;
import edu.unoesc.model.Produto;

@Controller
public class ProdutosController {

	@RequestMapping(value = "/produtos", method = RequestMethod.GET)
	public String produtosList(Model z, HttpSession session) {

		ArrayList<Produto> produtos;

		if (session.getAttribute("listProdutos") != null) {
			produtos = (ArrayList<Produto>) session.getAttribute("listProdutos");

		} else {
			produtos = new ArrayList<>();
			session.setAttribute("listProdutos", produtos);
		}

		z.addAttribute("listProdutos", produtos);
		z.addAttribute("produto", new Produto());

		return "Produtos";
	}

	@RequestMapping(value = "/produtoSave", method = RequestMethod.POST)
	public String save(@ModelAttribute("produto") Produto produto, HttpSession session) {
		ArrayList<Produto> produtos;
		produtos = (ArrayList<Produto>) session.getAttribute("listProdutos");

		produto.setId(produtos.size());
		produtos.add(produto);

		return "redirect:/produtos";
	}

	@RequestMapping(value = "/produtoDetail/{id}")
	public String produto(@PathVariable int id, Model model, HttpSession session) {
		// session.getAttribute("pessoasList");

		if (session.getAttribute("listProdutos") != null) {

			ArrayList<Produto> produtos;
			produtos = (ArrayList<Produto>) session.getAttribute("listProdutos");
			Produto prod = produtos.get(id);

			model.addAttribute("produto", prod);

			return "ProdutoDetail";
		}

		return this.produtosList(model, session);
	}

	@RequestMapping(value = "/produtoUpdate", method = RequestMethod.POST)
	public String produtoEdit(@ModelAttribute("produto") Produto produto, HttpSession session) {

		if (session.getAttribute("listProdutos") != null) {

			ArrayList<Produto> produtos;
			produtos = (ArrayList<Produto>) session.getAttribute("listProdutos");
			produtos.set(produto.getId(), produto);

			return "redirect:/produtos";
		}
		return "redirect:/produtos";
	}

	@RequestMapping(value = "/produtoDelete/{id}")
	public String deleteProduto(@PathVariable int id, Model model, HttpSession session) {
		// session.getAttribute("pessoasList");

		ArrayList<Produto> produtos;
		produtos = (ArrayList<Produto>) session.getAttribute("listProdutos");

		produtos.remove(id);

		return "redirect:/produtos";
	}

}
