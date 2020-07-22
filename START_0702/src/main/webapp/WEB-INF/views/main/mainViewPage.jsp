<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<jsp:include page="../template/header.jsp" />


	<img alt="" src="${pDTO.p_Img_Path }" ><br/><br/>
		
	구매
	<form action="buyPage" method="post">
		구매가격 : <input type="text" name="b_Price" /> 즉시구매가격보여주기 <br/><br/>
		입찰마감일 : 
		<select name="b_Expiredate">
			<option value="1">1일</option>
			<option value="3">3일</option>
			<option value="7">7일</option>
			<option value="15">15일</option>
			<option value="30">30일</option>
		</select><br/><br/>
		<input type="hidden" name="p_No" value="${pDTO.p_No }" />
		<input type="hidden" name="m_No" value="${loginDTO.m_No }" />
		<input type="submit" value="입찰하기" />
		<input type="reset" value="다시입력" />
	</form>


<%-- 		<!--  loginDTO가 null 일때 ! -->
		<c:if test="${empty mDTO }">
			<input type="button" value="목록으로" onclick="location.href='NoticePage'" />
		</c:if>
		
		<!--  loginDTO가 null 이 아닐때 ! -->
		<c:if test="${not empty mDTO }">
			<c:choose>
		
				<c:when test="${mDTO.m_State eq 1}">
					<input type="button" value="목록으로"
						onclick="location.href='NoticePage'" />
				</c:when>
		
				<c:when test="${mDTO.m_State eq 2}">
					<input type="button" value="수정하기"
						onclick="fn_noticeUpdate(this.form)" />
					<input type="button" value="삭제하기"
						onclick="fn_noticeDelete(this.form)" />
					<input type="button" value="목록으로"
						onclick="location.href='NoticePage'" />
				</c:when>
		
			</c:choose>
		</c:if> --%>



<%@ include file="../template/footer.jsp" %></body>