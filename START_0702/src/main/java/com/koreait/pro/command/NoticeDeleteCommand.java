package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dao.NoticeDAO;

public class NoticeDeleteCommand implements ProCommand {
	
	// 공지사항 삭제 커맨드
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int n_No = Integer.parseInt(request.getParameter("n_No"));
		
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		nDAO.NoticeDelete(n_No);

	}

}
