package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;

public class MemberSignUpCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_Id = request.getParameter("m_Id");
		String m_Pw = request.getParameter("m_Pw");
		String m_Name = request.getParameter("m_Name");
		String m_Phone = request.getParameter("m_Phone");
		String m_Email = request.getParameter("m_Email");
		String m_Address = request.getParameter("m_Address");
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.signUpMember(m_Name, m_Id, m_Pw, m_Phone, m_Email, m_Address);
		
	}

}























