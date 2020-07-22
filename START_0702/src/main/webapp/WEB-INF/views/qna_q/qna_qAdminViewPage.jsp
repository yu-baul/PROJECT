<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 관리자 1:1문의 전체 문의글 보는 리스트 -->

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{border-top : 1px solid gray;  border-collapse: collapse; width: 800px; margin: auto;}
th, td{border-top : 1px solid gray;  padding:10px;}
p{font-weight: bold; color:#5F7D95; font-size: 28px;}
.button{position: relative; left: 250px; padding-bottom: 10px;}
</style>

<script type="text/javascript">

	function fn_select(f){
		
		if  (f.query.value == '문의등록' || f.query.value == '문의'){
			f.column.value = 'Q_STATE';
			f.query.value = 1;
		}else if (f.query.value == '답변완료'|| f.query.value == '답변'){
			f.column.value = 'Q_STATE';
			f.query.value = 2;
		}
		
		f.action = 'qna_qSelectAdminViewPage';
		f.submit();
		
	}

</script>


<br/></br>
<div class ="main-menu"> 
<%-- 	<div>${mDTO.m_Name} 님</div> --%>
		
		<p>1:1 문의</p>  <br>
		
		<!-- 관리자 입장에서 회원검색하는 기능 - 최성락 -->
	<div id="wrap" style ="padding: 0px 0px 20px 0px;">
		<form name="form1" method="post" action="qna_qSelectAdminViewPage" style ="text-align: center; padding: 10px 0 0 0 ;">
		    <select name="column"  style="height: 25px;">
		    	<option value="M_NO">사용자-No</option>
		    	<option value="Q_CARTEGORY">문의분야</option>
		    	<option value="Q_TITLE">제목</option>
		    	<option value="Q_DATE">등록일</option>
		    	<option value="Q_STATE">답변상태</option>
		    </select>
		     
		    <input type="text" name="query" style="height:20px;"/>
		    <input type="button" value="검색" onclick="fn_select(this.form)" >
		</form>
	</div>
	<table style="color:gray;">
		<thead>
			<tr>
				<td>No</td>
				<td>사용자-No</td>
				<td>문의 분야</td>
				<td>제목</td>
				<td>등록일</td>
				<td>답변현황</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list  }">
				<tr>
					<td colspan="6">
					
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty list  }">
				<c:forEach var="qDTO" items="${list }">
					<tr>	
						<td>${qDTO.q_No }</td>
						<td>${qDTO.m_No }</td>
						<td>${qDTO.q_Cartegory }</td>
						<td><a href="qna_qUserViewPage?q_No=${qDTO.q_No }">${qDTO.q_Title }</a></td>
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
				<td colspan="6">${pageView }</td>
			</tr>
		</tfoot>
	</table>
</div>	
			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>













