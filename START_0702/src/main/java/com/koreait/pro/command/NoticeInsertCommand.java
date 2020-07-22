package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.NoticeDAO;

public class NoticeInsertCommand implements ProCommand {

	// 공지사항 삽입 커맨드
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String n_Title = request.getParameter("n_Title");
		String n_Content = request.getParameter("n_Content");
		
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		nDAO.NoticeInsert(n_Title, n_Content);
		
		

	}

}
