package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.NoticeDAO;

public class NoticeUpdateCommand implements ProCommand {

	// 공지사항 업데이트 커맨드
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int n_No = Integer.parseInt(request.getParameter("n_No"));
		String n_Title = request.getParameter("n_Title");
		String n_Content = request.getParameter("n_Content");
		
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		nDAO.NoticeUpdate(n_Title, n_Content, n_No);
		
		model.addAttribute("n_No", n_No);

	}

}
