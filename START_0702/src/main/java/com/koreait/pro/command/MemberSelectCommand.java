package com.koreait.pro.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.common.PageMakerSelect;
import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

public class MemberSelectCommand implements ProCommand {

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

		
		// beginRecord + endRecord = Map
		//Map<String, Integer> map = new HashMap<String, Integer>();
		//map.put("beginRecord", beginRecord);
		//map.put("endRecord", endRecord);
		
		
		// DB에서 list 가져오기
		MemberDAO mDAO =sqlSession.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> list = mDAO.selectMember(column, query, beginRecord, endRecord);
		//ArrayList<MemberDTO> list = mDAO.selectMember(column, query);
		
		// 전체 게시글 개수 구하기
		int totalRecord = mDAO.getSelectTotalRecord(column, query);
		
		
		// 페이지 생성 ( <<  1  2  3  >> )
		String pageView = PageMakerSelect.getPageView("memberSelect",  Integer.parseInt(page), recordPerPage, totalRecord, column, query);
		
		
		// request 에 저장해서 전달할 데이터
		model.addAttribute("page", page);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("list", list);
	}

}























