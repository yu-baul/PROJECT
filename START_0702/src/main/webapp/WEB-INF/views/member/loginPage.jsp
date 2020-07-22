<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="java.net.URLDecoder"%>

<jsp:include page="../template/header.jsp" />

<script type="text/javascript" >
   
   function login(f) {
      
      if (f.m_Id.value == '') {
       var id = document.getElementById('input_warn_id');
		id.style.color ='gray';
		id.style.margin ='auto';
		id.innerHTML ='아이디를 입력해주세요';
       /*   alert('아이디를 입력해주세요'); */
        f.m_Id.focus();
         return;
      }
      if (f.m_Pw.value == '') {
      /*    alert('비밀번호를 입력해주세요.'); */
      var pw = document.getElementById('input_warn_pw');
		pw.style.color ='gray';
		pw.style.margin ='auto';
		pw.innerHTML ='비밀번호를 입력해주세요';
         f.m_Pw.focus();
         return;
      }
      
      f.action='login';
      f.submit();
   }
   
</script>
<%
	// savedId 쿠키 여부 확인
	Cookie[] ckList = request.getCookies();
	String savedID = null;

	if (ckList != null && ckList.length > 0) {
		for (Cookie ck : ckList) {
			if (ck.getName().equals("savedID")) {
				savedID = URLDecoder.decode(ck.getValue(), "utf-8");
				break;
			}
		}
	}
%>
<style type="text/css" >

input[type =button]  {background-color: rgb(195, 214, 155);   border: rgb(195, 214, 155);   color: black;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
  
.login_wrap{width: 800px; margin:auto; }
form {width: 600px; margin:auto;  padding: 10px;}
.login-head {display: flex;  margin:auto; width:600px;}
.login-title, .singin-title {width:50%;  margin:auto; padding: 10px 20px; margin: 8px 0; }
.arae{text-align: right;}
.id_area{margin: 0 0 15px;}
.login-title:hover , .singin-title:hover {text-decoration: underline;}
input[type=text], input[type=password], input[type=button]{
	width: 50%; 
	padding: 5px 5px; margin: 5px 0; display:inline-block; 
	box-sizing: border-box;
}
/* p{text-align: left; padding-left: 10px;} */
p{margin:auto; text-align: left; padding-left: 150px; color:gray}
/* .area{ box-sizing: border-box; color:gray;} */
</style>

<div class ="main-menu"> 
 <div class="main-wrap"> 
		

<div class ="login-head">
	<div class ="login-title" style ="font-weight: bold"><a href="#"  >로그인</a></div>
	<div class ="singin-title"><a href="askSignUpPage">회원가입</a></div></div>
<section class= "login_wrap" >
<form method="post" class ="login-form" style= "border :1px solid gray">
	
	<% if ( savedID == null ) { %>
	<div class ="id_area" >
		<p class ="area"> 아이디 </p>
		<div class ="input_box" >  
			 <input type="text" name="m_Id" placeholder ="id"/> <br/><br/> 
		</div>
		<span id ="input_warn_id" ></span>
	</div>
	<div class ="pw_area">
		<p class ="area">비밀번호</p>
		<div class ="input_box" >  	
			<input type="password" name="m_Pw"  placeholder ="pw" /> 
		</div>
			<span id ="input_warn_pw" ></span>
		<!-- <div>	
			<input type="checkbox" name="saveIDChk" />아이디 기억하기<br/><br/>
		</div>	 -->
		
	</div>
	<% } else { %>
	<div class ="id_area">
		<p class ="area"> 아이디 </p>
		<div class ="input_box" > 
			<input type="text" name="m_Id" value="<%=savedID %>" /><br/><br/>
			<span id ="input_warn_id" ></span>
		</div> 
	</div>	
	<div class ="pw_area">
		<p class ="area">비밀번호</p>
		<div class ="input_box" >  	
			<input type="password" name="m_Pw" placeholder ="pw"/><br/> 
			<span id ="input_warn_pw" ></span>
			</div>	
			<!-- <div>
				<input type="checkbox" name="saveIDChk" checked />아이디 기억하기<br/><br/>
			</div> -->
	</div>			
	<% } %>
	
	
	<br/><!-- 캡챠 -->
	아래 이미지를 보이는 대로 입력해주세요.<br/>
	<img src="${pageContext.request.contextPath }/${DIRECTORY }/${filename }"  style="width: 300px;"/>
	<input id="img_load" type="button" value="이미지 새로고침" onclick="location.href='getImage'" /><br/>
	<input type="text" name="input_key" required /><br/><br/>
	
	
	<input type="button" value="로그인" onclick="login(this.form)" /><br>
	<input type="checkbox" name="saveIDChk" />아이디 기억하기<br/><br/>
	<a href ="findIdPage">아이디찾기</a>
	<a href ="findPwPage">비밀번호찾기</a>
  <!--     
      <input type="button" value="회원가입" onclick="location.href='signUpPage'">
	  <input type="button" value="아이디 찾기" onclick="location.href='findIdPage'" />
	  <input type="button" value="비밀번호 찾기" onclick="location.href='findPwPage'" /> -->
   </form>
</section>  

</div>
</div>
<%@ include file="../template/footer.jsp" %></body>