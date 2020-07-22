package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.Qna_aDAO;
import com.koreait.pro.dao.Qna_qDAO;
import com.koreait.pro.dto.Qna_ADTO;
import com.koreait.pro.dto.Qna_QDTO;

public class Qna_qUserViewPage implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int q_No = Integer.parseInt(request.getParameter("q_No"));
		
		Qna_qDAO qDAO = sqlSession.getMapper(Qna_qDAO.class);
		Qna_QDTO qDTO = qDAO.selectQNAmyView(q_No);
		Qna_aDAO aDAO = sqlSession.getMapper(Qna_aDAO.class);
		Qna_ADTO aDTO = aDAO.qna_aSelectView(q_No);
		
		model.addAttribute("qDTO", qDTO);
		model.addAttribute("aDTO", aDTO);
		
		
	}

}





















