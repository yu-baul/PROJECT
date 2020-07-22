package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.CartDAO;

public class CartDeleteCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int c_No = Integer.parseInt(request.getParameter("c_No"));
		String m_Id = request.getParameter("m_Id");
		
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		cDAO.cartDelete(c_No);
		
		model.addAttribute("m_Id", m_Id);

	}

}
