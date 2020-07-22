<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<script type="text/javascript" >
   
</script>

<style type="text/css">
 input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }

input{ margin :5px;}
#locker{width: 10%;}
</style>

<div class ="main-menu">    
<c:if test="${empty m_Id}">
   <%
       out.println("<script type='text/javascript'>");
       out.println("swal('필수', '아이디를 입력해주세요.', 'warning');"); // warning", "error", "success", "info"
       out.println("history.back();");
       out.println("</script>");
       out.close();
   %>
</c:if>
<c:if test="${not empty m_Id}">
   <img id ="locker" src =" resources/img/lock.png" alt ="" /> 
   <p>아이디 찾기 결과 : ${m_Id}</p><br>
   
   <input type="button" value="로그인하기" onclick="location.href='loginPage'" />
   <input type="button" value="비밀번호 찾기" onclick="location.href='findPwPage'" />

</c:if>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>