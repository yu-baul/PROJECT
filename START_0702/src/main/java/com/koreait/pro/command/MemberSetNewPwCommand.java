package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;

public class MemberSetNewPwCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String m_Id = request.getParameter("m_Id");
		String m_Pw = request.getParameter("m_Pw");
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		
		mDAO.setNewmPw(m_Id, m_Pw);
		
		/*
		 * try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('비밀번호가 변경되었습니다.');");
			out.println("</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
	}

}























