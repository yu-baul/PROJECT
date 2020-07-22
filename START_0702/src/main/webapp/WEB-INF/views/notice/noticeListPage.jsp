<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />


<style type="text/css">

input[type =button]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{/* border-top : 1px solid gray; */  border-collapse: collapse; width: 800px; margin: auto;}
th, td{/* border-top : 1px solid gray; */  padding:10px;}
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;} 
.path{text-align: right; position: absolute; top:30%; right:18%;}
.path_p{ padding: 45px 15px 2px 0;}
.btn{padding: 0 0 10px 720px;}
</style>


<div class ="main-menu">  
	<div class ="path">
		<p class="path_p"><a href="">홈</a>  > <a href="">공지</a></p>
	</div>

<br/></br>

	<p class="subtitle">공지사항</p>  <br>
	<p style ="color: gray">관리자가 알려드립니다.<p><br><br>
	
	<!--  loginDTO가 null 일 때! -->
	<div class="btn">
					<c:if test="${empty mDTO }">
						<input type="button" value="로그인" onclick="location.href='loginPage'">
					</c:if>
			
					<!--  loginDTO가 null 이 아닐때 ! -->
					<c:if test="${not empty mDTO }">
						<c:choose>
							<c:when test="${mDTO.m_State eq 2}">
								<input type="button" value="등록하기" onclick="location.href='NoticeInsertPage'">
							</c:when>
			
						</c:choose>
					</c:if>
	</div>				
 	<table style="color:gray;" >
		<thead style="background-color:#f5f5f5;">
			<tr style="height: 5px;">
				<th style="width: 80px">No</th>
				<th style="width: 500px">제목</th>
				<th style="width: 100px">등록일</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="3">공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="nDTO" items="${list }">
					<tr>
						<td >${nDTO.n_No }</td>
						<td><a href="NoticeViewPage?n_No=${nDTO.n_No }">${nDTO.n_Title }</a></td>
						<td>${nDTO.n_Date }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
		
			<tr>
				<td colspan="3" style ="width : 20px;">${pageView}</td>
			</tr>
		</tfoot>
</table>

<br><br><br>
</div>	
			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>













