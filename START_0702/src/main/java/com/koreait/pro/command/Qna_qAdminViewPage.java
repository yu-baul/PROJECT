package com.koreait.pro.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.common.PageMaker;
import com.koreait.pro.dao.Qna_qDAO;
import com.koreait.pro.dto.Qna_QDTO;

public class Qna_qAdminViewPage implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// 관리자모드  1 : 1 문의  리스트 보기
		Map<String, Object> map1 = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map1.get("request");
		
		String page = request.getParameter("page");
		if (page == null || page.isEmpty()) {
			page = "1";
		}
		
		// page 를 알아야 가져올 list 의 begin 과 end 를 알 수 있다.
		int recordPerPage = 10;  // board, bbs, guestbook, member 등 모두 다른 값을 줄 수 있다.
		int beginRecord = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;

		
		// beginRecord + endRecord = Map
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", beginRecord);
		map.put("endRecord", endRecord);
		
		// DB에서 list 가져오기
		Qna_qDAO qDAO = sqlSession.getMapper(Qna_qDAO.class);
		ArrayList<Qna_QDTO> list = qDAO.qna_qList(map);
		
		
		// 전체 게시글 개수 구하기
		int totalRecord = qDAO.getAllTotalRecord();

		// 페이지 생성 ( <<  1  2  3  >> )
		String pageView = PageMaker.getPageView("qna_qAdminViewPage", Integer.parseInt(page), recordPerPage, totalRecord);
		
		
		// model 에 저장해서 전달할 데이터
		model.addAttribute("page", page);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("list", list);
		


	}

}
