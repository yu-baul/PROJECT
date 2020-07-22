<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;} 
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{border-top : 1px solid gray;  border-collapse: collapse; width: 600px; margin: auto;}
th, td{border-top : 1px solid gray;  padding:10px;}
.button{position: relative; left: 250px; padding-bottom: 10px;}
</style>


<div class ="main-menu"> 
	
	<p class="subtitle">판매목록</p>  <br>
	<p style ="color: gray">판매중인 상품의 현황을 볼수 있어요<p><br><br>
	<span class="button">
		<input type="button" value="상품등록" onclick="location.href='productInsertPage'" />
	</span>	
	
	<table>
		<thead>
			<tr>		
				<th>이미지</th>
				<th>상품명</th>
				<th>가격</th>
				<th>판매상태</th>
			</tr>
		</thead>
	
		<tbody>
			<c:if test="${empty pDTO }">
				<tr>
					<td colspan="4">상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty pDTO }">

				<c:forEach var="pDTO" items="${pDTO }">
					<tr>
						<td><a href="productViewPage?p_No=${pDTO.p_No }"><img alt="${pDTO.p_Img_Path }" width="200px;" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"></a></td>
						<td>${pDTO.p_Name }</td>
						<td><fmt:formatNumber value="${pDTO.p_Price }" />원</td>
						<c:if test="${pDTO.p_State eq 1 }">
							<td>판매중</td>
						</c:if>
						<c:if test="${pDTO.p_State eq 2 }">
							<td>승인대기중</td>
						</c:if>
						<c:if test="${pDTO.p_State eq -1 }">
							<td>판매완료</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			
		</tbody>
		<tfoot >
			<tr style ="height:50px ">
				<td colspan="4">${pageView }</td>
			</tr>
		</tfoot>
	
	</table>
	
				
		
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>