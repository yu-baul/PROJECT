package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.Qna_qDAO;

public class Qna_qInsert implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

	    // request 로 데이터 받을 준비
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//RedirectAttributes rttr = (RedirectAttributes) map.get("rttr");
		
		int m_No = Integer.parseInt(request.getParameter("m_No"));
		String q_Cartegory = request.getParameter("q_Cartegory");
		String q_Title = request.getParameter("q_Title");
		String q_Content = request.getParameter("q_Content");
		
		Qna_qDAO qDAO = sqlSession.getMapper(Qna_qDAO.class);
		
		//rttr.addFlashAttribute("m_No", m_No);
		qDAO.qna_qInsert(m_No, q_Cartegory, q_Title, q_Content);
		
		model.addAttribute("m_No", m_No);

	}

}
