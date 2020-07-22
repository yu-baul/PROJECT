package com.koreait.pro.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

public class MemberMoneyChargeCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int m_No = Integer.parseInt(request.getParameter("m_No"));
		int m_Money= Integer.parseInt(request.getParameter("m_Money"));
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		
		mDAO.moneyCharge(m_No, m_Money);

		HttpSession session = request.getSession();
		
		MemberDTO loginDTO = mDAO.selectMemberBymNo(m_No);
		
		session.setAttribute("mDTO", loginDTO);
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('충전이 정상적으로 완료되었습니다.');");
			out.println("history.go(-2);");
			out.println("</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
