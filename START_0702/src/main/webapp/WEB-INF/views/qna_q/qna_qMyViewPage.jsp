<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{ border-collapse: collapse; width: 600px; margin: auto; height:25px;}
th, td{/* border-top : 1px solid gray; */  padding:10px;}
 p.question {font-weight: bold; color:#5F7D95; font-size: 28px;}

.button{position: relative; left: 250px; padding-bottom: 10px;}
</style>
<div class ="main-menu"> 
	<p class="question">내 질문</p><br><br>
	<table>
		<!-- <tr>
			<th>문의분야 </th>
			<th>제목 </th>
			<th>작성일 </th>
		</tr> -->
		<tr style ="/* border-top: 1px solid gray; */ height: 50px; background-color:#f5f5f5;">
			<td>문의 분야 : ${qDTO.q_Cartegory }</td>
			<td>제목: ${qDTO.q_Title } </td>
			<td> ${qDTO.q_Date } </td>
		</tr>
		<!-- <tr style="height: 10px;">
			<td></td>
		</tr> -->
		<tr style=" /* border-top: 1px solid gray;  */ height: 40px;">
			<td  colspan="3" >${qDTO.q_Content }</td>
		</tr>
		<tr>
			<td colspan="3"  style="height: 50px;"></td>
		</tr>
		<tr style="height: 50px; /* border-top : 1px solid gray; */ background-color:#f5f5f5;">
			<td colspan="3" >관리자 답변</td>
		</tr>
		<tr  style=" /* border: 1px dotted gray; */ height: 40px;">
			<td colspan="3">
			
				<c:choose>
				<c:when test="${qDTO.q_State eq 1 }">
						답변이 비어있습니다. 신속하게 답변드리겠습니다.<br/>
				</c:when>
				<c:when test="${qDTO.q_State eq 2 }">
					<div>
						${aDTO.a_Content }
					</div>
				</c:when>
			</c:choose>
			
			
			</td>
		</tr>
		
	</table>
	
	
<%-- 	<table>
		<!-- <tr>
			<th>문의분야 </th>
			<th>제목 </th>
			<th>작성일 </th>
		</tr> -->
		<tr style ="/* border-top: 1px solid gray; */ height: 50px; background-color:#f5f5f5;">
			<td>문의 분야 : ${qDTO.q_Cartegory }</td>
			<td>제목: ${qDTO.q_Title } </td>
			<td> ${qDTO.q_Date } </td>
		</tr>
		<!-- <tr style="height: 10px;">
			<td></td>
		</tr> -->
		<tr style=" /* border-top: 1px solid gray;  */ height: 40px;">
			<td  colspan="3" >${qDTO.q_Content }</td>
		</tr>
		<tr>
			<td colspan="3"  style="height: 50px;"></td>
		</tr>
		<tr style="height: 50px; /* border-top : 1px solid gray; */ background-color:#f5f5f5;">
			<td colspan="3" >관리자 답변</td>
		</tr>
		<tr  style=" /* border: 1px dotted gray; */ height: 40px;">
			<td colspan="3">
			
				<c:choose>
				<c:when test="${qDTO.q_State eq 1 }">
						답변이 비어있습니다. 신속하게 답변드리겠습니다.<br/>
				</c:when>
				<c:when test="${qDTO.q_State eq 2 }">
					<div>
						답변이완료되었습니다. <br/>
						${aDTO.a_Content }
					</div>
				</c:when>
			</c:choose>
			
			
			</td>
		</tr>
		
	</table> --%>
<%-- 	<div>
		문의 분야 <span>${qDTO.q_Cartegory }</span> &nbsp;&nbsp;&nbsp;
		제목<span>${qDTO.q_Title }</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		글 작성일 <span>${qDTO.q_Date }</span>
			
	</div> 
		
		<br/><br/><br/><br/>
		<div>
				${qDTO.q_Content }
		</div>
		
		<div>
			<c:choose>
				<c:when test="${qDTO.q_State eq 1 }">
					<div>
						신속하게 답변드리겠습니다.<br/>
						<textarea name="a_Content" rows="10" cols="50" readonly>답변이 비어있습니다.</textarea><br/><br/>
					</div>
				</c:when>
				<c:when test="${qDTO.q_State eq 2 }">
					<div>
						답변완료<br/>
						<textarea name="a_Content" rows="10" cols="50" readonly>${aDTO.a_Content }</textarea><br/><br/>
					</div>
				</c:when>
			</c:choose>
		</div>--%>

		<%-- <div>
			<div>
				<span>${qDTO.q_Cartegory }</span> &nbsp;&nbsp;&nbsp;
				<span>${qDTO.q_Title }</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>${qDTO.q_Date }</span>
			</div>
		</div>
		<hr>
		<br/><br/><br/><br/>
		<div>
			<div>
				
				<span>${qDTO.q_Content }</span>
			</div>
		</div>
		<br/><br/><br/><br/>
		<hr>
		<div>
			<c:choose>
				<c:when test="${qDTO.q_State eq 1 }">
					<div>
						신속하게 답변드리겠습니다.<br/>
						<textarea name="a_Content" rows="10" cols="50" readonly>답변이 비어있습니다.</textarea><br/><br/>
					</div>
				</c:when>
				<c:when test="${qDTO.q_State eq 2 }">
					<div>
						답변완료<br/>
						<textarea name="a_Content" rows="10" cols="50" readonly>${aDTO.a_Content }</textarea><br/><br/>
					</div>
				</c:when>
			</c:choose>
		</div> --%>
</div>	
	<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>