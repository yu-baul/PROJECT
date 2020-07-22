package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

public class MemberMyViewUpdateCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String m_Pw = request.getParameter("m_Pw");
		String m_Name = request.getParameter("m_Name");
		String m_Address = request.getParameter("m_Address");
		String m_Id = request.getParameter("m_Id");
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.myViewUpdate(m_Pw, m_Name, m_Address, m_Id);
		
		
		MemberDTO loginDTO = mDAO.selectBymIdmPw(m_Id, m_Pw);

		HttpSession session = request.getSession();
		
		session.setAttribute("mDTO", loginDTO);
		
	}

}
