package com.koreait.pro.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

@SuppressWarnings("unchecked")
public class MemberPhoneCheckCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		try {
			// 1. 전달되는 파라미터 저장
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			HttpServletResponse response = (HttpServletResponse)map.get("response");
			request.setCharacterEncoding("utf-8");
			String m_Phone = request.getParameter("m_Phone");

			// 2. mEmail 를 가진 회원 정보 확인
			MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
			MemberDTO mDTO = mDAO.selectBymPhone(m_Phone);

			// 3. 응답할 JSONObject 객체 생성
			JSONObject obj = new JSONObject();

			// 4. mId 를 가진 회원이 있으면 obj 에 result 변수에 "EXIST" 저장
			//    mId 를 가진 회원이 없으면 obj 에 result 변수에 "" 저장
			if ( mDTO != null ) {
				obj.put("result", "EXIST");
			} else {
				obj.put("result", "");
			}

			// 5. obj 를 응답
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(obj);
			out.close();

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}

