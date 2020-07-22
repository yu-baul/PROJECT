<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />


<style type="text/css">
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{border-top : 1px solid gray;  border-collapse: collapse; width: 800px; margin: auto;}
th, td{border-top:1px solid gray;}
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
.button{position: relative; left: 250px; padding-bottom: 10px;}
</style>

	<script type="text/javascript">
		function fn_cartDelete(f){
			if(confirm('정말 삭제하시겠습니까?')){
				f.action = 'cartDelete';
				f.submit();
			}
		}
	</script>
<div class ="main-menu"> 
	<p class ="subtitle">장바구니</p>  <br>
	<p style ="color: gray">주문하려는 상품의 상품명을 확인해주세요<br><br><p>
	<table>
		<thead>
			<tr style="height: 30px">
				<td colspan="2" style="width:200px">상품명</td>
				<td style="width:100px">가격</td>
				<td style="width:100px">판매자</td>
				<td style="width:100px">주문상태</td>
				<td style="width:100px">삭제</td>
			</tr>
		</thead>
	
		<tbody>

			<c:if test="${empty cDTO }">
				<tr>
					<td colspan="6">장바구니가 비었습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty cDTO }">
					
				<c:forEach var="cDTO" items="${cDTO }">
					<tr style="height: 150px">
						<td><a href="productViewPage?p_No=${cDTO.p_No }"><img alt="${cDTO.p_Img_Path }" width="100px" height ="100px" src="${pageContext.request.contextPath }/resources/storage/${cDTO.p_Img_Path }"></a></td>
						<td>${cDTO.p_Name }</td>
						<td><fmt:formatNumber value="${cDTO.p_Price }" />원</td>
						<td>${cDTO.m_Id }</td>
						<td>
							<c:if test="${cDTO.p_State eq 1 }">
								판매중
							</c:if>
							<c:if test="${cDTO.p_State eq 2 }">
								승인대기중
							</c:if>
							<c:if test="${cDTO.p_State eq -1 }">
								판매완료
							</c:if>
						</td>
						<td>
							<form name="f">
								<input type="hidden" name="c_No" value="${cDTO.c_No }" />
								<input type="hidden" name="m_Id" value="${mDTO.m_Id }" />
								<input type="image" alt ="delete" src ="resources/img/close.png" onclick="fn_cartDelete(this.form)" />
								<!-- <input type="button" value="삭제" onclick="fn_cartDelete(this.form)" /> -->
								<!-- <img alt ="delete" src ="resources/img/close.png" onclick="fn_cartDelete()"> -->
							</form>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr style="height: 30px">
				<td colspan="6"> ${pageView }</td>
			</tr>
		</tfoot>
	
	</table>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>