package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dao.ProductDAO;

public class productCancleCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// 구매자에게 돈 다시 주고, 상품 테이블 구매자 번호 널로 바꾸고, 상태 1로 바꾸고 
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int p_No = Integer.parseInt(request.getParameter("p_No"));
		int b_No = Integer.parseInt(request.getParameter("b_No"));
		int p_Price = Integer.parseInt(request.getParameter("p_Price"));
		
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		pDAO.ProductCancle(p_No);
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.AdminMinusMoney(p_Price);
		mDAO.MemberBackMoney(b_No, p_Price);
		
		
		
	}

}
