<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 동적인 페이지 포함 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../template/header.jsp" />

<style type="text/css">
  input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
form {width: 500px; margin:auto; padding: 30px; color: gray;} 
fieldset{padding: 30px;} 
legend {  color: #5F7D95;   padding: 5px; }
input{ margin :5px;}
</style>

<script type="text/javascript" >

	function fn_findPw(f) {
		
		if(f.m_Id.value == '') {
			swal("필수", "아이디를 입력해주세요.", "warning"); // warning", "error", "success", "info"
			return;
		}
		
		if(f.m_Email.value == '') {
			swal("필수", "이메일을 입력해주세요.", "warning"); // warning", "error", "success", "info"
			return;
		}
		
		f.action='findPw';
		f.submit();
		
	}

</script>
<div class ="main-menu"> 
<form method="post">
 <fieldset style="border:1 solid gray ">
 	 <legend >비밀번호 찾기</legend>
 	비밀번호를 찾으실 아이디를 입력하세요.<br/><br/>

	<label>아이디</label><input type="text"  name="m_Id" ><br/><br/>
	
 	가입하실때 작성하신 이메일을 입력하세요.<br/><br/>
	<label>이메일</label><input type="text"  name="m_Email" ><br/><br/>
	<input type="button" id="button" value="비밀번호 찾기" onclick="fn_findPw(this.form)"/>
</fieldset>	
</form>
</div>


<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>