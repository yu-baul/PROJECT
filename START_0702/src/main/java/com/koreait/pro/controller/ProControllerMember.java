package com.koreait.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.pro.command.MemberDeleteCommand;
import com.koreait.pro.command.MemberEmailAuthCommand;
import com.koreait.pro.command.MemberEmailCheckCommand;
import com.koreait.pro.command.MemberFindIdCommand;
import com.koreait.pro.command.MemberFindPwCommand;
import com.koreait.pro.command.MemberGetImage;
import com.koreait.pro.command.MemberIdCheckCommand;
import com.koreait.pro.command.MemberLoginCommand;
import com.koreait.pro.command.MemberLogoutCommand;
import com.koreait.pro.command.MemberMoneyChargeCommand;
import com.koreait.pro.command.MemberMyViewUpdateCommand;
import com.koreait.pro.command.MemberPhoneCheckCommand;
import com.koreait.pro.command.MemberSelectCommand;
import com.koreait.pro.command.MemberSetNewPwCommand;
import com.koreait.pro.command.MemberSignUpCommand;
import com.koreait.pro.command.MemberViewCommand;
import com.koreait.pro.command.ProCommand;

@Controller
public class ProControllerMember {

	@Autowired
	private SqlSession sqlSession;
	private ProCommand proCommand;

	@Autowired
	private JavaMailSender mailSender;


	// 회원가입 페이지 이동
	@RequestMapping("askSignUpPage")
	public String goAskSignUpPage() {
		return "member/askSignUpPage";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("signUpPage")
	public String goSignUpPage() {
		return "member/signUpPage";
	}

	// 회원가입  - 유바울 & 김수범
	@RequestMapping(value="signUp", method=RequestMethod.POST)
	public String signUp(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberSignUpCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:/";
	}

	// 로그인 페이지로 이동  - 김수범
	@RequestMapping("loginPage")
	public String goLoginPage(HttpServletRequest request, Model model) {
		// HttpSession session = request.getSession();

		/*
				     request.getSession().getAttribute("referer");
				    // requestUrl 가 null 이 아니거나 referer 가 null이 아닐경우
				    if (request.getRequestURI() != null && request.getHeader("referer") != null) {
				    // 이전페이지가 loginPage이거나 직접 로그인URL에 접속하지 않았을때만 referer 저장
				    if ( !(request.getHeader("referer").equals("http://localhost:9090/pro/loginPage")) 
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/findId")) 
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/findIdPage")) 
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/findPw")) 
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/findPwPage")) 
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/setNewPwPage") )
				    		&& !(request.getHeader("referer").equals("http://localhost:9090/pro/findIdResultPage") )
				    	) {
				    // lastPage 세션에 이전 페이지 정보 저장
				    	session.setAttribute("referer", request.getHeader("referer"));
				       }else {
				    	   session.setAttribute("referer", request.getHeader("http://localhost:9090/pro/index"));
				       }
				   }
		 */
		
		model.addAttribute("request", request);
		proCommand = new MemberGetImage();
		proCommand.execute(sqlSession, model);
		
		return "member/loginPage";   
	}

	// 로그인 김수범 & 한덕구
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberLoginCommand();
		proCommand.execute(sqlSession, model);
		/*
		 * String referer = (String) request.getSession().getAttribute("referer"); // referrer는 이전 페이지 정보가 저장되어있음.
				    return "redirect:" + referer;   
		 */
		return "redirect:/";
	} 

	// 아이디 찾기 페이지 단순 이동 // 한덕구
	@RequestMapping("findIdPage")
	public String goFindIdPage() {
		return "member/findIdPage";
	}

	// 아이디 찾기 // 한덕구
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberFindIdCommand();
		proCommand.execute(sqlSession, model);
		return "member/findIdResult";

	}

	// 비밀번호 찾기 페이지 단순 이동 // 한덕구
	@RequestMapping("findPwPage")
	public String goFindPwPage() {
		return "member/findPwPage";
	}

	// 비밀번호 찾기 // 한덕구
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPw(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberFindPwCommand();
		proCommand.execute(sqlSession, model);
		return "member/setNewPwPage";
	}


	// 새 비밀번호 설정하기 // 한덕구
	@RequestMapping(value="setNewPw", method=RequestMethod.POST)
	public String setNewPw(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		ProCommand proCommand = new MemberSetNewPwCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:/";
	} 

	// 마이페이지 
	@RequestMapping(value="myView")
	public String myView() {
		return "member/myView";
	}

	// 로그아웃 - 유바울
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberLogoutCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:home";
	}

	// 회원 목록 리스트(관리자 모드) - 유바울
	@RequestMapping("memberView")
	public String memberView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberViewCommand();
		proCommand.execute(sqlSession, model);
		return "member/memberViewListPage";
	}
	// 관리자모드에서 회원목록 검색하기 - 유바울
	@RequestMapping("memberSelect")
	public String memberSelect(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberSelectCommand();
		proCommand.execute(sqlSession, model);
		return "member/memberViewListPage";
	}

	// 회원 정보 수정 - 유바울 & 김수범
	@RequestMapping(value="myViewUpdate", method=RequestMethod.POST)
	public String myViewUpdate (HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberMyViewUpdateCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:home";
	}


	// 아이디 확인 - 김수범
	@RequestMapping(value="IdCheck", method=RequestMethod.POST)
	@ResponseBody
	public void idCheck (HttpServletResponse response, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberIdCheckCommand();
		proCommand.execute(sqlSession, model);
	}

	// 이메일 확인 - 김수범
	@RequestMapping(value="EmailCheck", method=RequestMethod.POST)
	@ResponseBody
	public void emailCheck (HttpServletResponse response, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberEmailCheckCommand();
		proCommand.execute(sqlSession, model);
	}	

	// 핸드폰 확인 - 김수범
	@RequestMapping(value="PhoneCheck", method=RequestMethod.POST)
	@ResponseBody
	public void PhoneCheck(HttpServletResponse response, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberPhoneCheckCommand();
		proCommand.execute(sqlSession, model);
	}
	
	// 충전 단순 이동 - 김수범/송원섭
	@RequestMapping("moneyChargePage") 
	public String moneyChargePage(){
		return "member/moneyChargePage";
	}
	// 잔액 충전 - 김수범/송원섭
	@RequestMapping("moneyCharge")
	public String moneyCharge(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberMoneyChargeCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:myView";
	}
	
	// 회원 탈퇴 단순 이동 - 김수범
	@RequestMapping("myViewDeletePage")
	public String myViewDeletePage() {
		return "member/myViewDeletePage";
	}
	
	// 회원 탈퇴
	@RequestMapping("myViewDelete")
	public String myViewDelete(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		proCommand = new MemberDeleteCommand();
		proCommand.execute(sqlSession, model);
		return "redirect:myView";
	}
	
	// 가입 시 이메일 인증
	@RequestMapping("emailAuth")
	@ResponseBody
	public void emailAuth(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		model.addAttribute("mailSender", mailSender);
		proCommand = new  MemberEmailAuthCommand();
		proCommand.execute(sqlSession, model);
	}
	
	
	// 캡챠 이미지 받아오기(새로고침)  - 송원섭
	@RequestMapping("getImage")
	public String getImage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		proCommand = new MemberGetImage();
		proCommand.execute(sqlSession, model);
		return "member/loginPage";
	}





}
