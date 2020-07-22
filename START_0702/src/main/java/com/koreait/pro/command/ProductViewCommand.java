package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dao.ProductDAO;
import com.koreait.pro.dto.ProductDTO;

public class ProductViewCommand implements ProCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      int p_No = Integer.parseInt(request.getParameter("p_No"));
      
      ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
      MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
      
      model.addAttribute("pDTO", pDAO.selectProductByNo(p_No));
      ProductDTO pDTO = pDAO.selectProductByNo(p_No);
      int s_No = pDTO.getS_No();
      model.addAttribute("m_Id", mDAO.selectMid(s_No));
      
      // 조회수
      // 보여 줄 게시물 정보는 세션에 올려서 활용한다.
      HttpSession session = request.getSession();
      session.setAttribute("pDTO", pDTO);
      
      String open = (String) session.getAttribute("open");
      if(open == null || open == "no") {
    	  session.setAttribute("open", "yes");
    	  pDAO.updateHit(p_No);
      }
      

   }

}