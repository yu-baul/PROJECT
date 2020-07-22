<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<script type="text/javascript">

   function fn_setNewPw(f){
      if(f.m_Pw.value == '' || f.m_Pw2.value == '') {
         swal("필수", "비밀번호와 비밀번호확인 모두 입력하셔야 합니다.", "warning"); // warning", "error", "success", "info"
         return;
      }
      
      if(f.m_Pw.value != f.m_Pw2.value) {
         swal("오류", "비밀번호와 비밀번호확인은 같아야합니다. 다시 확인해 주세요.", "error"); // warning", "error", "success", "info"
         return;
      }
      
      f.action='setNewPw';
      f.submit();
   }

</script>

<style type="text/css">
 input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }

input{ margin :5px;}
#locker{width: 10%;}
div label{ text-align: left; padding-right: 10px;}
</style>



<div class ="main-menu"> 
 <form method="post">
    
    <c:if test="${empty m_Id}">
      <script type="text/javascript">
         alert('일치하는 회원정보가 없습니다.');
         history.back();         
      </script>
    </c:if>
    <c:if test="${not empty m_Id}">
          <p><strong>${m_Id}</strong>  님 새로운 비밀 번호를 설정해 주세요. </p>
           
          <img id ="locker" src =" resources/img/lock.png" alt ="" /> 
      <div>      
          <p><label>비밀번호 설정</label><input type="password" name="m_Pw" >
         <p><label>비밀번호 확인</label><input type="password" name="m_Pw2" ><br><br>
         <input type="hidden" name="m_Id" value="${m_Id}"></p>
         <input type="button" value="비밀번호 바꾸기" onclick="fn_setNewPw(this.form)" />
       </div>
    </c:if>
   
   
    
 </form>
</div>         
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>