package com.koreait.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.pro.command.CartDeleteCommand;
import com.koreait.pro.command.CartInsertCommand;
import com.koreait.pro.command.CartListCommand;
import com.koreait.pro.command.ProCommand;

@Controller
public class ProControllerCart {
	
	@Autowired
	private SqlSession sqlSession;
	private ProCommand proCommand;
	
	
	// 장바구니 담기  -송원섭
	@RequestMapping("cartInsert")
	public String cartInsert(RedirectAttributes rttr, HttpServletRequest request, Model model) {
		model.addAttribute("rttr", rttr);
		model.addAttribute("request", request);
		proCommand = new CartInsertCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:productListPage";
	}
	
	// 장바구니 목록  -송원섭
	@RequestMapping("cartList")
	public String cartList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new CartListCommand();
		proCommand.execute(sqlSession, model);
		return "cart/cartListPage";
	}
	
	// 장바구니 삭제  -송원섭
	@RequestMapping("cartDelete")
	public String cartDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new CartDeleteCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:cartList";
	}
	
	
	
}
