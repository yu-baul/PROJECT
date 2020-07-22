<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<div>
	<div>
		<form action="memberSelect" >
			<select name="column">
				<option value="m_No">번호</option>
				<option value="m_Name">성명</option>
				<option value="m_Id">아이디</option>
				<option value="m_Address">주소</option>
				<option value="m_Phone">전화</option>
				<option value="m_Email">이메일</option>
				<option value="m_Grade">등급</option>
			</select>
			<input type="text" name="query">
			<input type="submit" value="검색">
		</form>
	</div>
</div>

<table border="1">
		<thead>
			<tr class="ft">
				<td>번호</td>
				<td>성명</td>
				<td>아이디</td>
				<td>주소</td>
				<td>전화</td>
				<td>이메일</td>
				<td>등급</td>
				<td>포인트</td>
				<td>가입일</td>
				<td>비고</td>
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
						<td>${mDTO.m_Point }</td>
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
				<td colspan="10">
					${pageView}
					<!-- 
					<input type="button" value="삭제하기"  onclick="location.href=''">
					
					 -->
				</td>
			</tr>
		</tfoot>
	</table>
			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>