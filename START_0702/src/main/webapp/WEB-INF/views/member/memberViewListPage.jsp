<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
	
	p{font-weight: bold; color:#5F7D95; font-size: 28px; text-align: center; padding: 10px 20px; margin: auto;}
	table{border-top : 1px solid gray;  border-collapse: collapse; margin: auto;}
	th, td{border-top : 1px solid gray;  padding:10px;}
	input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
</style>

<script type="text/javascript">

	function fn_select(f){
		
		if  (f.query.value == '정상회원' || f.query.value == '정상' ){
			f.column.value = 'm_State';
			f.query.value = 1;
		}else if (f.query.value == '탈퇴회원' || f.query.value == '탈퇴'){
			f.column.value = 'm_State';
			f.query.value = 0;
		}
		
		f.action = 'memberSelect';
		f.submit();
		
	}

</script>
<div class ="main-menu"> 
<p>회원목록</p>


<div>
		<form  >
			<select name="column">
				<option value="m_No">번호</option>
				<option value="m_Name">성명</option>
				<option value="m_Id">아이디</option>
				<option value="m_Address">주소</option>
				<option value="m_Phone">전화</option>
				<option value="m_Email">이메일</option>
				<option value="m_Grade">등급</option>
				<option value="m_State">비고</option>
			</select>
			<input type="text" name="query">
			<input type="button" value="검색" onclick="fn_select(this.form)">
		</form>
		<br>
</div>

<table style="color:gray;">
		<thead>
			<tr class="ft" style="height: 3px">
				<td style="width: 35px">번호</td>
				<td style="width: 100px">성명</td>
				<td style="width: 100px">아이디</td>
				<td style="width: 150px">주소</td>
				<td style="width: 200px">전화</td>
				<td style="width: 200px">이메일</td>
				<td style="width:100px">등급</td>
				<td style="width:100px">포인트</td>
				<td style="width: 100px">가입일</td>
				<td style="width: 100px">비고</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="10"></td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="mDTO" items="${list }">
					<tr>
						<td>${mDTO.m_No }</td>
						<td>${mDTO.m_Name }</td>
						<td>${mDTO.m_Id }</td>
						<td>${mDTO.m_Address }</td>
						<td>${mDTO.m_Phone }</td>
						<td>${mDTO.m_Email }</td>
						<td>${mDTO.m_Grade }</td>
						<td><fmt:formatNumber value="${mDTO.m_Point }" /></td>
						<td>${mDTO.m_Regdate }</td>
						<c:choose>
							<c:when test="${mDTO.m_State eq 1  }">
								<td>정상회원</td>
							</c:when>
							<c:when test="${mDTO.m_State eq 0  }">
								<td>탈퇴회원</td>
							</c:when>
						</c:choose>
						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="10" style ="height: 50px;">
				
					${pageView}
					<!-- 
					<input type="button" value="삭제하기"  onclick="location.href=''">
					
					 -->
				</td>
			</tr>
		</tfoot>
	</table>
</div>			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>