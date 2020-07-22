package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dao.ProductDAO;
import com.koreait.pro.dto.MemberDTO;

public class productUpdateStateCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int p_No = Integer.parseInt(request.getParameter("p_No")); //구매 상품 넘버
		int m_No = Integer.parseInt(request.getParameter("m_No")); //로그인된 사용자 넘버

		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		pDAO.ProductUpdateState(m_No, p_No);
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.MemberUpdatePrice1(p_No);
		mDAO.MemberUpdatePrice2(p_No);
		
		HttpSession session = request.getSession();

		MemberDTO loginDTO = mDAO.selectMemberBymNo(m_No);

		session.setAttribute("mDTO", loginDTO);
	}

}