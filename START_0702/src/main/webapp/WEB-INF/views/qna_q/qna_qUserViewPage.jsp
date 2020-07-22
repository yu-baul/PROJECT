<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 관리자 1:1문의 전체 문의글 보는 리스트 에서 제목을 누르면 문의글 보기 -->

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<style type="text/css">
input[type =button] , input[type =reset]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }

.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;} 
table{border-top : 1px solid gray;  border-collapse: collapse; width: 600px; margin: auto;}
th, td{border-top : 1px solid gray;  padding:10px;}
</style>


	<script type="text/javascript" >
   	
		function fn_NotNullInsert(f){
			
			if (f.a_Content.value == ''){
				swal("필수", "답글이 비어있습니다.", "warning"); // warning", "error", "success", "info"
				f.a_Content.focus();
				return;
			}
			
			f.action = 'qna_aInsert';
			f.submit();
			
		}
		function fn_BackInsert(f){
			
			if (f.a_Content.value != null ){
				swal("오류", "등록되어 있는 문의글입니다.", "error"); // warning", "error", "success", "info"
				f.a_Content.focus();
				return;
			}
			
		}
   
   
   
   </script>

<div class ="main-menu"> 
	<p class="subtitle">답변하기</p>  <br>
<!-- <ul class="myPage-tap">
		<li><a href="NoticePage">공지사항</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<li><a href="qna_qAdminViewPage">1:1문의</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<li><a href="myView">내정보</a></li>
</ul> -->

<form method="post">
	<table> 
		<tr style ="background-color:#f5f5f5;" >
			<td>${qDTO.q_Cartegory } </td>
			<td>     ${qDTO.q_Title} </td>
			<td>    ${qDTO.q_Date }  </td>
		</tr>
		<tr>
			<td colspan="3">${qDTO.q_Content }</td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea name="a_Content" rows="10" cols="50">${aDTO.a_Content }</textarea>
				<input type="hidden" value="${qDTO.q_No }" name="q_No">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<c:choose>
						<c:when test="${empty aDTO.a_Content }">
							<input type="button" value="등록하기" onclick="fn_NotNullInsert(this.form)">
						</c:when>
						<c:when test="${not empty aDTO.a_Content }">
							<input type="button" value="등록하기" onclick="fn_BackInsert(this.form)">
						</c:when>
					</c:choose>
			</td>
		</tr>
	</table>
</form>
</div>
		<%-- <div>
			<div>
				<span>${qDTO.q_Cartegory }</span> &nbsp;&nbsp;&nbsp;
				<span>${qDTO.q_Title }</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>${qDTO.q_Date }</span>
			</div>
		</div>
	
			<div>
				
				<span>${qDTO.q_Content }</span>
			</div>
		</div>
		 --%>
		<%-- <div>
			
				<form method="post">
					<textarea name="a_Content" rows="10" cols="50">${aDTO.a_Content }</textarea><br/><br/>
					<input type="hidden" value="${qDTO.q_No }" name="q_No">
					<c:choose>
						<c:when test="${empty aDTO.a_Content }">
							<input type="button" value="등록하기" onclick="fn_NotNullInsert(this.form)">
						</c:when>
						<c:when test="${not empty aDTO.a_Content }">
							<input type="button" value="등록하기" onclick="fn_BackInsert(this.form)">
						</c:when>
					</c:choose>
				</form>
				
			
		</div>
</div>	 --%>
	<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>