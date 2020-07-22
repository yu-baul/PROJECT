<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />


<style type="text/css">

table{border-top : 1px solid gray;  border-collapse: collapse; width: 600px; margin: auto;}
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
.list_order{text-align:center; }
.order_stuff{border: 1px solid gray; width: 600px; margin: 10px 0px 0px; padding: 0px 30px;position: relative; left:30%; top:0px; }
.order_info{display: flex; margin:auto; border-top: 1px solid gray; padding: 14px 0px 20px;}
dl{display: flex;}
.name{font-size: 20px; text-align: left; padding: 5px;}
.pic, .desc{padding: 5px; }
dl > dt {padding: 0px 20px 0px 0px;}
content{text-align: center; margin:auto; }

</style>


<div class ="main-menu" >  

<div class="content">
	<p class="subtitle">구매내역</p>  <br>
	
	<p style ="color: gray">최근에 구매한 상품의 목록을 볼 수 있어요<p><br><br>
	<ul class ="list_order">
	
		<li>
			<c:forEach var="pDTO" items="${pDTO }">
			<!-- <div class="date" style="text-align: left; padding-left: 30%">날짜</div> -->
			<div class="order_stuff">
				<div class ="name">
					<a>${pDTO.p_Name }</a>
				</div>
				<div class="order_info">
					
						<div class ="pic">
							<img alt="${pDTO.p_Img_Path }" width ="100px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }">
						</div>
						<div class ="desc">
							<dl>
								<dt class="tit">주문번호  </dt>
								<dd>${pDTO.p_No }</dd>
							</dl>
							
							<dl>
								<dt class="tit">구매가격  </dt>
								<dd style="font-weight: bold"><fmt:formatNumber value="${pDTO.p_Price }" />원</dd>
							</dl>
							
							<dl>
								<dt>주문상태</dt>
								<dd style="font-weight: bold">
									<c:if test="${pDTO.p_State eq 2 }">
									승인대기중
									</c:if>
									<c:if test="${pDTO.p_State eq -1 }">
										구매완료
									</c:if>
															
								</dd>
							</dl>
						</div>
						
				</div>
			</div>
			</c:forEach>
		</li>
	
	
		</ul>
			<br>
		${pageView}
</div>	
</div>		
	
	
	
	<%-- <table border="1">
		<thead>
			<tr>
				<td>이미지</td>
				<td>상품명</td>
				<td>가격</td>
				<td>판매자</td>
				<td>주문상태</td>
			</tr>
		</thead>
	
		<tbody>
		
			
		
			<c:if test="${empty pDTO }">
				<tr>
					<td colspan="5">구매 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty pDTO }">
			
					
				<c:forEach var="pDTO" items="${pDTO }">
					<tr>
						
						<td><img alt="${pDTO.p_Img_Path }" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"></td>
						<td>${pDTO.p_Name }</td>
						<td><fmt:formatNumber value="${pDTO.p_Price }" />원</td>
						<td>${pDTO.m_Id }</td>
						<td>
							<c:if test="${pDTO.p_State eq 2 }">
								승인대기중
							</c:if>
							<c:if test="${pDTO.p_State eq -1 }">
								구매완료
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${pageView}</td>
			</tr>
		</tfoot>
	
	</table> --%>


<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>