<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
/* p{font-weight: bold; color:#5F7D95; font-size: 28px;} */
.main-menu{ height: 100%}
/* #name_wrap,#wrap{position: absolute; top:35%; left:30%; } */
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
input[type =button]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{/*  border-top : 1px solid gray;  */  border-collapse: collapse; width: 800px;}
th, td{/* border-top : 1px solid gray; */  padding:10px;}

</style>


<div class ="main-menu"> 
	<p class="subtitle">1:1 문의</p>  <br>
<p style ="color: gray">궁금사항이나 문의사항을 자유롭게 남겨주세요<p><br><br>
 <ul class="subtitle"> 	
	<%-- <li id="name_wrap"><strong>${mDTO.m_Name} 님	</strong></li> --%>
	<li>
		<input type="button" value="질문하기" onclick="location.href='qna_qUpdatePage'">
	</li>
</ul>	 


	<div id="wrap">
		<table style="border-collapse: collapse; color:#5F7D95; margin:0 auto; ">
		<colgroup>
			<col style="width:15%;">
			<col style="width:35%;">
			<col style="width:15%;">
			<col style="width:35%;">
		</colgroup>
				<thead style="background-color:#f5f5f5;">
				<tr>
					<td>문의 분야</td>
					<td>제목</td>
					<td>등록일</td>
					<td>답변현황</td>
				</tr>
				</thead>
			<tbody style ="border-top : 1px solid gray;">
				<c:if test="${empty list  }">
					<tr>
						<td colspan="4">
						
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty list  }">
					<c:forEach var="qDTO" items="${list }">
						<tr>
							<td>${qDTO.q_Cartegory }</td>
							<td><a href="qna_qMyViewPage?q_No=${qDTO.q_No }">${qDTO.q_Title }</a></td>
							<td>${qDTO.q_Date }</td>
							<c:choose>
								<c:when test="${qDTO.q_State eq 1 }">
									<td>문의등록</td>
								</c:when>
								<c:when test="${qDTO.q_State eq 2 }">
									<td>답변완료</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">${pageView }</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>













