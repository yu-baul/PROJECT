package com.koreait.pro.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.pro.dto.MemberDTO;

public class MemberLogoutCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// session 에 저장된 로그인 유저의 정보를 삭제
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO)session.getAttribute("mDTO");
		

		
		if (mDTO != null) {
			// session 초기화
			session.invalidate();
		} 

	}

}
