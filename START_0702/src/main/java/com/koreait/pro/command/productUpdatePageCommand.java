package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.ProductDAO;
import com.koreait.pro.dto.ProductDTO;

public class productUpdatePageCommand implements ProCommand {

   @Override
   public void execute(SqlSession sqlSession, Model model) {
      
      Map<String, Object> map = model.asMap();
      HttpServletRequest request = (HttpServletRequest) map.get("request");
      
      int p_No = Integer.parseInt(request.getParameter("p_No"));
      
      ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
      ProductDTO pDTO = pDAO.selectProductByNo(p_No);
      
      model.addAttribute("pDTO", pDTO);
      

   }

}