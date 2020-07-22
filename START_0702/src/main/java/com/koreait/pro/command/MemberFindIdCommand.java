package com.koreait.pro.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

public class MemberFindIdCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String m_Email = request.getParameter("m_Email");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO mDTO = mDAO.selectBymEmail(m_Email);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (mDTO == null) {
            out.println("<script type='text/javascript'>");
			out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
         } else {
        	 model.addAttribute("m_Id", mDTO.getM_Id());
         }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
