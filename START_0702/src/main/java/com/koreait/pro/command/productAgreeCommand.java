package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dao.ProductDAO;

public class productAgreeCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int p_Price = Integer.parseInt(request.getParameter("p_Price")); //구매 상품 가격
		
	    int m_Point = p_Price / 20;  // 포인트 5% 적립
		int p_No = Integer.parseInt(request.getParameter("p_No")); //구매 상품 넘버
		
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		
		String m_Grade = mDAO.getmGrade(p_No);
		
		pDAO.ProductAgreeState(p_No);
		
		if (m_Grade.equalsIgnoreCase("BRONZE")) {
			p_Price = p_Price - ((int)(p_Price*0.05));
		} else if (m_Grade.equalsIgnoreCase("SILVER")) {
			p_Price = p_Price - ((int)(p_Price*0.045));
		} else if(m_Grade.equalsIgnoreCase("GOLD")) {
			p_Price = p_Price - ((int)(p_Price*0.04));
		} else if(m_Grade.equalsIgnoreCase("VIP")) {
			p_Price = p_Price - ((int)(p_Price*0.035));
		} else {
			p_Price = p_Price - ((int)(p_Price*0.03));
		}
		
		mDAO.MemberUpdatePrice3(p_No, p_Price);
		mDAO.MemberUpdatePrice4(p_Price);
		mDAO.MemberUpdatePoint(m_Point, p_No);
	    mDAO.MemberUpdateGrade(p_No);
	}

}