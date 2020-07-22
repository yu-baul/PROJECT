package com.koreait.pro.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.common.PageMakerSelect;
import com.koreait.pro.dao.Qna_qDAO;
import com.koreait.pro.dto.Qna_QDTO;

public class Qna_qSelectCommand implements ProCommand {

	@Override
	   public void execute(SqlSession sqlSession, Model model) {
	
	      Map<String, Object> map1 = model.asMap();
	      HttpServletRequest request = (HttpServletRequest) map1.get("request");
	      
	      String column = request.getParameter("column");
	      String query = request.getParameter("query");
	      String page = request.getParameter("page");
	      
	      if (page == null || page.isEmpty()) {
				page = "1";
			}
			
		  // page 를 알아야 가져올 list 의 begin 과 end 를 알 수 있다.
		  int recordPerPage = 10;  // board, bbs, guestbook, member 등 모두 다른 값을 줄 수 있다.
		  int beginRecord = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		  int endRecord = beginRecord + recordPerPage - 1;
		  
		  // DB에서 list 가져오기
		  Qna_qDAO qDAO = sqlSession.getMapper(Qna_qDAO.class);
		  Map<String, String> map = new HashMap<String, String>();
		  map.put("column", column);
		  map.put("query", query);
		  map.put("beginRecord", beginRecord + "");
		  map.put("endRecord", endRecord + "");
		  ArrayList<Qna_QDTO> list = qDAO.selectQna_q(map);
		  
		  // 전체 게시글 개수 구하기
		  int totalRecord = qDAO.getSelectTotalRecord(map);
		  
		  // 페이지 생성 ( <<  1  2  3  >> )
		  String pageView = PageMakerSelect.getPageView("qna_qSelectAdminViewPage",  Integer.parseInt(page), recordPerPage, totalRecord, column, query);
			
	      
		  // model 에 저장해서 전달할 데이터
		  model.addAttribute("page", page);
		  model.addAttribute("pageView", pageView);
		  model.addAttribute("totalRecord", totalRecord);
		  model.addAttribute("list", list);
	   }

}













