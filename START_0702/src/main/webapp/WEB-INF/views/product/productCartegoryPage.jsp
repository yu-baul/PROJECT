<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">
	.product-wrap{width: 1150px; height: 1200px; margin:auto; }
	 ul.product-list{list-style-type:none; padding: 0;  }
	ul.product-list > li {position: relative;  display: inline-block;
	width:300px; height: 450px;  padding: 10px; margin:20px;}
	ul.product-list > li >img {width: 300px; height: 200px; position:absolute; top:0; left:0;}
	ul.product-list > li >div.desc{width:300px; height: 100px; position:absolute;  }
	/* div.desc > span { font-weight: bold; background-color: orange;} */
	span.true {font-weight: bold; background-color: orange;}
	span.false {font-weight: bold; background-color: yellow;}
	.left-box{float: left;}
	.left-box:hover {box-shadow: 5px 10px 8px #888888;}
	h3{margin: 15px; text-align: center;}
	.number-box{	clear: left; padding:60px 10px 0px 0px; font-size: 20px;   }
	input[type =submit]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }

.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
</style>

<div class ="main-menu">  

	<p class ="subtitle">
		<c:if test="${p_Cartegory eq 'fashion'}" > 패션</c:if>
		<c:if test="${p_Cartegory eq 'digital'}" > 디지털</c:if>
		<c:if test="${p_Cartegory eq 'food'}" > 식품</c:if>
		<c:if test="${p_Cartegory eq 'book'}" > 도서</c:if>
		<c:if test="${p_Cartegory eq 'sports'}" > 스포츠</c:if>
		<c:if test="${p_Cartegory eq 'music'}" > 음반</c:if>
	</p><br/>
	
	
	<%-- <h3 style ="font-size: 35px">
		<c:if test="${p_Cartegory eq 'fashion'}" > 패션</c:if>
		<c:if test="${p_Cartegory eq 'digital'}" > 디지털</c:if>
		<c:if test="${p_Cartegory eq 'food'}" > 식품</c:if>
		<c:if test="${p_Cartegory eq 'book'}" > 도서</c:if>
		<c:if test="${p_Cartegory eq 'sports'}" > 스포츠</c:if>
		<c:if test="${p_Cartegory eq 'music'}" > 음반</c:if>
	</h3><br/> --%>
	
	
	  
	<div class="product-wrap">
	
	
	<div>
		
			<form action="productCartegorySelect" >
				<select name="column" style="height: 25px;">
					<option value="m_Id">판매자 아이디</option>
					<option value="p_Name">제품명</option>
				</select>
				<input type="text" name="query" style="height:20px;">
				<input type="hidden" name="p_Cartegory" value="${p_Cartegory }">
				<input type="submit" value="검색" >
			</form>
		
	</div> 
	<p style="text-align: right;margin: auto;padding-right: 15%;">게시물 수 : ${totalRecord }</p> 
		<ul class ="product-list">	
			<c:if test="${empty pDTO }">
				상품이 없습니다.
			</c:if>
			<c:if test="${not empty pDTO }">
				
					<c:forEach var="pDTO" items="${pDTO }">
				<li class ="left-box">
						<a href="productViewPage?p_No=${pDTO.p_No }">
						<img alt="${pDTO.p_Img_Path }" width ="300px" height ="300px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"></a><br/>
						<div class ="desc">
						 <h3 class ="desc-title">
						 ${pDTO.p_Name }</h3><br>
						 <fmt:formatNumber value="${pDTO.p_Price }" />원<br/>
						 판매자 : ${pDTO.m_Id }<br/>
						</div>
					</c:forEach>
				
			</c:if>
		</ul>
			
	</div>
	<div class ="number-box">
		${pageView }
	</div>	
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>