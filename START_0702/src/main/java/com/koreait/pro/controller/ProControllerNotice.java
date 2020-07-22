package com.koreait.pro.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.pro.command.NoticeDeleteCommand;
import com.koreait.pro.command.NoticeInsertCommand;
import com.koreait.pro.command.NoticeListCommand;
import com.koreait.pro.command.NoticeUpdateCommand;
import com.koreait.pro.command.NoticeViewCommand;
import com.koreait.pro.command.ProCommand;

@Controller
public class ProControllerNotice {
	
	@Autowired
	private SqlSession sqlSession;
	private ProCommand proCommand;
	
		// 공지사항 페이지로 이동, 리스트 출력  -송원섭
		@RequestMapping("NoticePage")
		public String NoticePage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new NoticeListCommand();
			proCommand.execute(sqlSession, model);
			return "notice/noticeListPage";
		}
			
		// 공지사항 내용 보기  -송원섭
		@RequestMapping("NoticeViewPage")
		public String NoticeViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new NoticeViewCommand();
			proCommand.execute(sqlSession, model);
			return "notice/noticeViewPage";
		}
			
		// 공지사항 내용 수정  -송원섭
		@RequestMapping(value="NoticeUpdate", method=RequestMethod.POST)
		public String NoticeUpdate(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new NoticeUpdateCommand();
			proCommand.execute(sqlSession, model);
			return "redirect:NoticePage";
		}
			
		// 공지사항 삭제  -송원섭
		@RequestMapping(value="NoticeDelete", method=RequestMethod.POST)
		public String NoticeDelete(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new NoticeDeleteCommand();
			proCommand.execute(sqlSession, model);
			return "redirect:NoticePage";
		}
			
		// 공지사항 삽입페이지로 이동  -송원섭
		@RequestMapping("NoticeInsertPage")
		public String NoticeInsertPage() {
			return "notice/noticeInsertPage";
		}
			
		// 공지사항 삽입  -송원섭
		@RequestMapping(value="NoticeInsert", method=RequestMethod.POST)
		public String NoticeInsert(HttpServletRequest request, Model model) {
			model.addAttribute("request", request);
			proCommand = new NoticeInsertCommand();
			proCommand.execute(sqlSession, model);
			return "redirect:NoticePage";
		}
}
