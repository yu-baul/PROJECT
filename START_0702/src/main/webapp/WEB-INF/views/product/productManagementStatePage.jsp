<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<style type="text/css">
	.product-wrap{width: 1150px; margin:auto; }
	/* ul.product-list{list-style-type:none; padding: 0; border: 1px solid red;} */
	.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px; text-align: center;} 
	.filter{text-align: center; padding: 10px;}
	.filter > a{padding: 10px;}
	
	ul.product-list > li {position: relative;  display: inline-block;
	width:300px; height: 400px;  padding: 10px; margin:20px;}
	ul.product-list > li >img {width: 300px; height: 200px; position:absolute; top:0; left:0;}
	ul.product-list > li >div.desc{width:300px; height: 100px; position:absolute;  }
	/* div.desc > span { font-weight: bold; background-color: orange;} */
	span.selling {font-weight: bold; background-color: orange;}
	span.pending {font-weight: bold; background-color: yellow;}
	span.sold{font-weight: bold; background-color: green;}
	.left-box{float: left;}
	.left-box:hover {box-shadow: 5px 10px 8px #888888;}
	.p_State{text-align: center;}
	.search{margin-left: 600px;}
	.total{margin-left:450px;}
	.number-box{clear: left; padding:60px 20px 25px 0px; font-size: 20px;  text-align: center; }
	input[type =submit]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;   display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
</style>



 <div class="main-wrap"> <br/></br>
	<p class="subtitle">상품관리</p>
		<%-- <h3 style ="font-size: 35px" class="p_State">
			<c:if test="${p_State eq 1}" >판매중</c:if>
			<c:if test="${p_State eq 2}" >승인대기중</c:if>
			<c:if test="${p_State eq -1}" >판매완료</c:if>
		</h3><br/> --%>
	
		<div class ="filter" >
			
					 	<a href="productManagementPage">전체</a>
						<a href="productManagementState?p_State=1">판매중</a>
						<a href="productManagementState?p_State=2">승인대기중</a>
						<a href="productManagementState?p_State=-1">판매완료</a>
		</div>
	
<div class="product-wrap">	
	<div>
			<form action="productManagementStateSelect"  style ="text-align: center; padding: 10px 0 0 0 ;">
				<select name="column" style="height: 25px;">
					<option value="m_Id">판매자 아이디</option>
					<option value="p_Name">제품명</option>
				</select>
				<input type="text" name="query"  style="height:20px;">
				<input type="hidden" name="p_State" value="${p_State }">
				<input type="submit" value="검색" >
			</form>
	</div>  
		
<p style="text-align: right;margin: auto;padding-right: 15%;">상품 수 : ${totalRecord }</p> 	
		<ul class ="product-list">
			<c:if test="${empty pDTO }">
			
					<li>상품이 없습니다.</li>
				
			</c:if>
		<c:if test="${not empty pDTO }">
	
			<c:forEach var="pDTO" items="${pDTO }">
				
				<li class ="left-box">
					<a href="productViewPage?p_No=${pDTO.p_No }">
						<img alt="${pDTO.p_Img_Path }" width="300px" height="300px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"></a>
					
					<div class ="desc">
					 <h3 class ="desc-title">${pDTO.p_Name }</h3><br>
					 판매자 : ${pDTO.m_Id }
					 가격 : <fmt:formatNumber value="${pDTO.p_Price }" />원<br><br>
					<!--  <span> -->
						<c:if test="${pDTO.p_State eq 1 }">
							<span class ="selling">판매중 </span>
						</c:if>
						<c:if test="${pDTO.p_State eq 2 }">
							<span class ="pending">승인대기중</span>
						</c:if>
						<c:if test="${pDTO.p_State eq -1 }">
							<span class ="sold">판매완료 </span>
						</c:if>
				<!-- 	</span>	 -->
					</div>
				</li>
					<%-- <td><a href="mainViewPage?p_No=${pDTO.p_No }"><img alt="" src="${pDTO.p_Img_Path }"></a><br /></td> --%>
					
					
			
			</c:forEach>
		</c:if>
		</ul>
				<div class ="number-box">
				${pageView }
				</div>		
	</div>	
	

	<%-- <table border="1">
	
		<tbody>
			<c:if test="${empty pDTO }">
				<tr>
					<td>상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty pDTO }">
					<c:forEach var="pDTO" items="${pDTO }">
				<tr>
	
						<td>${pDTO.p_Name }</td>
						<td>${pDTO.m_Id }</td>
						<td>${pDTO.p_Price }원</td>
						<td><a href="productViewPage?p_No=${pDTO.p_No }"><img alt="${pDTO.p_Img_Path }" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"></a></td>
						<td><a href="mainViewPage?p_No=${pDTO.p_No }"><img alt="" src="${pDTO.p_Img_Path }"></a><br /></td>
						<c:if test="${pDTO.p_State eq 1 }">
							<td>판매중</td>
						</c:if>
						<c:if test="${pDTO.p_State eq 2 }">
							<td>판매완료</td>
						</c:if>
						
				</tr>
					</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
	
		</tfoot>
	
	</table> --%>

</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>