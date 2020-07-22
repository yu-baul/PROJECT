package com.koreait.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.pro.command.ProCommand;
import com.koreait.pro.command.Qna_aInsert;

@Controller
public class ProControllerQna_A {
	
	@Autowired
	private SqlSession sqlSession;
	private ProCommand proCommand;
	
	// 관리자모드 1:1문의 답글 달기 - 유바울
	@RequestMapping(value="qna_aInsert", method=RequestMethod.POST)
	public String qna_aInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new Qna_aInsert();
		proCommand.execute(sqlSession, model);
		return "redirect:qna_qAdminViewPage";
	}
}
