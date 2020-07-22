package com.koreait.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.pro.command.ProCommand;
import com.koreait.pro.command.Qna_qAdminViewPage;
import com.koreait.pro.command.Qna_qInsert;
import com.koreait.pro.command.Qna_qMyViewPage;
import com.koreait.pro.command.Qna_qSelectCommand;
import com.koreait.pro.command.Qna_qUserViewPage;
import com.koreait.pro.command.Qna_qViewPage;

@Controller
public class ProControllerQna_Q {
	
	@Autowired
	private SqlSession sqlSession;
	private ProCommand proCommand;
	
		// 1:1 문의 페이지로 이동 -유바울
		@RequestMapping("qnaViewPage")
		public String QnAViewPage(HttpServletRequest request, Model model){
			model.addAttribute("request", request);
			proCommand = new Qna_qViewPage();
			proCommand.execute(sqlSession, model);
			return "qna_q/qna_ViewPage";
		}
		
		// 1:1 문의 등록 페이지로 이동 - 유바울
		@RequestMapping("qna_qUpdatePage")
		public String qna_qUpdate(){
			return "qna_q/qna_qUpdatePage";
		}
		
		// 1:1 질문 등록하기 - 유바울
		@RequestMapping("qna_qUpdate")
		public String qna_qUpdate(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			//int m_No = Integer.parseInt(request.getParameter("m_No"));
			// model.addAttribute("rttr", rttr);
			proCommand = new Qna_qInsert();
			proCommand.execute(sqlSession, model);
			return "redirect:qnaViewPage";//?m_No=" + m_No;
		}
		
		// 1:1 문의 등록한 목록에서 등록한 거 확인하기 - 유바울
		@RequestMapping("qna_qMyViewPage")
		public String qna_qMyViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new Qna_qMyViewPage();
			proCommand.execute(sqlSession, model);
			return "qna_q/qna_qMyViewPage";
		}
		
		// 관리자모드 1:1 문의  전체 리스트 보기 - 유바울
		@RequestMapping("qna_qAdminViewPage")
		public String qna_qAdminViewPage(HttpServletRequest request,Model model) {
			model.addAttribute("request", request);
			proCommand = new Qna_qAdminViewPage();
			proCommand.execute(sqlSession, model);
			return "qna_q/qna_qAdminViewPage";
		}
		// 관리자모드 1:1 문의 유저글 보기 - 유바울
		@RequestMapping("qna_qUserViewPage")
		public String qna_qUserViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new Qna_qUserViewPage();
			proCommand.execute(sqlSession, model);
			return "qna_q/qna_qUserViewPage";
		}
		
		// 관리자모드 1:1문의 유저 글 검색 - 최성락
		@RequestMapping("qna_qSelectAdminViewPage")
		public String Qna_qSelectCommand(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new Qna_qSelectCommand();
			proCommand.execute(sqlSession, model);
			return "qna_q/qna_qAdminViewPage";
		}
		
}
