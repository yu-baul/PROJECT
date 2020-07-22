package com.koreait.pro.command;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

import com.koreait.pro.dao.MemberDAO;
import com.koreait.pro.dto.MemberDTO;

public class MemberLoginCommand implements ProCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			HttpServletResponse response = (HttpServletResponse)map.get("response");
			response.setContentType("text/html; charset=UTF-8");
			
			String m_Id = request.getParameter("m_Id");
			String m_Pw = request.getParameter("m_Pw");
			MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);

			MemberDTO loginDTO = mDAO.selectBymIdmPw(m_Id, m_Pw);

			HttpSession session = request.getSession();

			session.setAttribute("mDTO", loginDTO);
			
			
			String saveIDChk = request.getParameter("saveIDChk");
			Cookie cookie = null;
			// 1. 아이디 기억하기(saveIDChk)를 체크했다면,
			if ( saveIDChk != null ) {
				cookie = new Cookie("savedID", URLEncoder.encode(m_Id, "utf-8")); 
				// 쿠키이름(savedID), 사용자의 아이디가 쿠키값으로 저장된다. 보안+
				cookie.setMaxAge(60 * 60 * 24 * 7);  // savedID 쿠키는 일주일간 유효하다.
				response.addCookie(cookie);  // savedID 쿠키를 사용자의 웹 브라우저(쿠키저장소)에 저장한다.
			}

			// 2. 아이디 기억하기(saveIDChk)를 체크하지 않았다면,
			// 기존에 생성된 savedID 쿠키 여부를 확인해서 삭제
			else {
				Cookie[] ckList = request.getCookies();
				if ( ckList != null && ckList.length > 0 ) {
					for ( Cookie ck : ckList ) {
						if ( ck.getName().equals("savedID") ) {
							cookie = new Cookie("savedID", URLEncoder.encode("", "utf-8"));
							cookie.setMaxAge(0);
							response.addCookie(cookie);
							break;
						}
					}
				}
			}
			
			
			
			/***** 3. 사용자가 입력한 값 검증 요청하기 *****/
			String clientId = "MxDBVGv826VAjC3RY2hQ";  // 애플리케이션 클라이언트 아이디값";
		    String clientSecret = "mngQmYsliN";  // 애플리케이션 클라이언트 시크릿값";
		    
		    // 사용자가 입력한 값과 발급 받은 키 값을 준비
		    request.setCharacterEncoding("utf-8");
		    String input_key = request.getParameter("input_key");  // 사용자가 입력한 캡차 이미지 글자값
		    String key = (String) session.getAttribute("key");  // 캡차 키 발급시 받은 키값
		    
		    String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
		    String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + input_key;
		    
		    URL url = new URL(apiURL);
		    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("X-Naver-Client-Id", clientId);
		    conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
		    int responseCode = conn.getResponseCode();
		    String strResult = null;
		    if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
		    	strResult = readBody(conn.getInputStream());
		    } else { // 에러 발생
		    	strResult = readBody(conn.getErrorStream());
		    }
		    
		     System.out.println(strResult);
		    // {"result":true,"responseTime":5.92}
		    // "result" 키 값을 가진 데이터가 true 이면 입력 성공, false 이면 입력 실패
		    
		    JSONParser parser = new JSONParser();
		    JSONObject obj = (JSONObject) parser.parse(strResult);
		    
		   /* request.setAttribute("result", obj.get("result"));*/
		    boolean result = (boolean) obj.get("result");
			//session.setAttribute("result", obj.get("result"));
			

			
			
			if (loginDTO != null) {
				if(loginDTO.getM_State() == 0){
					session.invalidate();
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
					out.println("onload = () => {location.href='getImage';}");
					out.println("</script>");
					out.close();
				}
				else if(result) {
					session.setAttribute("loginDTO", loginDTO);  // 로그인에 성공하면 회원정보가 session 에 저장된다.
				} 
				else {  // 캡챠 입력 틀렸을때
					session.invalidate();
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
					out.println("onload = () => {location.href='getImage';}");
					out.println("</script>");
					out.close();
				}
			}  else {  // 회원정보 입력 틀렸을때
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
				out.println("onload = () => {location.href='getImage';}");
				out.println("</script>");
				out.close();
			}
			
			
			
			
			

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
		
	
	private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
	

	

}

