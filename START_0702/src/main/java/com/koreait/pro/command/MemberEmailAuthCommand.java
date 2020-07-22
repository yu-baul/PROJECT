package com.koreait.pro.command;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

public class MemberEmailAuthCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			
			// 1. 전달되는 파라미터 저장
			long authKey = 0;
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpServletResponse response = (HttpServletResponse) map.get("response");
			JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
			request.setCharacterEncoding("utf-8");
			String m_Email = request.getParameter("m_Email");
			
			
			
			// 2. SimpleMailMessage 클래스가 이메일 내용을 작성한다.
			SimpleMailMessage message = new SimpleMailMessage();
						
			message.setTo(m_Email); // 받는 사람의 메일 주소
			message.setSubject("이메일 인증입니다."); // 제목
			authKey = (long)(Math.random() * 1000000000) + 123456789; // 자유롭게 인증키 생성
			message.setText("다음 인증번호를 입력하세요");
			message.setText("인증번호 : " + authKey);
			
			// 3. mailSender 는 send() 메소드로 이메일을 보낸다.
			mailSender.send(message);
			
			// 4. 응답할 JSONObject 객체 생성
			JSONObject obj = new JSONObject();
			obj.put("authKey",authKey);
			
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
