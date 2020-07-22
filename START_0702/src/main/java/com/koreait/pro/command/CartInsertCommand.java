package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.pro.dao.CartDAO;
import com.koreait.pro.dto.CartDTO;

public class CartInsertCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes) map.get("rttr");
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String m_Id = request.getParameter("m_Id");
		int p_No = Integer.parseInt(request.getParameter("p_No"));
		
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		CartDTO CART = cDAO.selectCartByIdNo(m_Id, p_No); //장바구니에 담겨있나 확인
		
		if(CART == null) {  // 검색 결과가 없다면
			cDAO.cartInsert(m_Id, p_No);  // 장바구니에 추가
		} else { // 검색 결과가 있으면
			rttr.addFlashAttribute("insertResult", "0");
			rttr.addFlashAttribute("beInserted", true);
		}
		

	}

}
