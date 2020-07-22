package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.Qna_aDAO;
import com.koreait.pro.dao.Qna_qDAO;

public class Qna_aInsert implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// request 로 데이터 받을 준비
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int q_No = Integer.parseInt(request.getParameter("q_No"));
		String a_Content = request.getParameter("a_Content");
		
		Qna_qDAO qDAO =sqlSession.getMapper(Qna_qDAO.class);
		Qna_aDAO aDAO = sqlSession.getMapper(Qna_aDAO.class);
		
		// 1:1 문의 답글 달기 INSERT
		aDAO.qna_aInsert(q_No, a_Content);
		// 1:1 문의 등록현황 상태 바꾸기
		qDAO.qna_qStateUpdate(q_No);
		
	}

}
