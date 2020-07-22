<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<script type="text/javascript">

   function fn_Buy(){
	   var f = document.forms.f;
      if(confirm('이 상품을 구매 하시겠습니까?')){
         
    	 if(${pDTO.p_Price } > ${mDTO.m_Money} ) {
    		 swal("오류", "잔액이 부족합니다.", "error"); // warning", "error", "success", "info"
    		 return;
    	 }
    	  
    	  
    	 f.action = 'productUpdateState';
         f.submit();
      }
   }
   
   function fn_delete() {
	   var f = document.forms.f;
	   if(confirm('정말로 삭제하시겠습니까?')) {
		   f.action='productDelete';
		   f.submit();
	   }
	   
   }
   
   function fn_update(){
	   var f = document.forms.f;
       f.action = 'productUpdatePage';
       f.submit();
   }
   
   function fn_cart(){
	   var f = document.forms.f;
	   if(confirm('장바구니에 담으시겠습니까?')){
		   f.action = 'cartInsert';
	       f.submit();
	   }
   }
   
   function fn_agree(){
	   var f = document.forms.f;
	   if(confirm('해당 거래를 승인하시겠습니까?')){
		   f.action = 'productAgree';
	       f.submit();
	   }  
   }
   
   function fn_cancle(f){
	   if(confirm('해당 거래를 취소하시겠습니까?')){
		   f.action = 'productCancle';
	       f.submit();
	   }  
   }
</script>

<style type="text/css">
.inner_view {display:flex; margin:auto; width: 1000px;}
.left-wrap{text-align: left; padding:0 60px 0 0; margin: 0 0 0 50px;}
strong.name {padding: 0 100px 10px 0;  width: 200px;}

.group_btn{margin: 100px 34px 10px 50px;}
.goods_price{border-bottom: 1px solid gray; padding: 5px 10px 10px 0; font-size: 28px; }
.won{font-size: 15px;}

div.goods_content dl{display: flex; }
dl > dt {padding: 0px 20px 0px 0px; }
dl{margin: 7px;}

input[type =button], #buy  { background-color:rgb(195, 214, 155);   border: none;  color: black;
  padding: 5px 5px;    text-decoration: none; width: 100px; height: 45px; 
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
#back  {/* background-color:rgb(195, 214, 155); */  border: 2px solid rgb(195, 214, 155);  color: black;
background-color: white;
  padding: 5px 5px;    text-decoration: none; width: 100px; height: 45px; 
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }  
  #img_location{ position:absolute;  padding-left: 1px;}
</style>

   
<div class ="main-menu"> 
   <form name ="f">
   <div class ="inner_view"> 
	   <div class="right-wrap">
		   	<div class ="img">
		   		<img alt="${pDTO.p_Img_Path }" width= "450px" height="400px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }">
		   	</div>
	   	</div>
	   	<div class="left-wrap">
		   	<p class ="goods_name">
		   	
		   	 <span class="btn_cart ">
		   		<Strong class ="name" style="font-size: 20px;"> ${pDTO.p_Name } </Strong>
		   		<c:if test="${pDTO.s_No ne mDTO.m_No and mDTO.m_No ne 1 and not empty mDTO}">
			   		<span id="img_location">
				   		<img alt ="cart" src ="resources/img/cart.png" onclick="fn_cart()">
			   		</span>
		   		</c:if>
		   	</span>	<br> 		   	
		   	
		   	<span class ="short_desc"  style="font-size: 14px; padding: 4px 60px 0 0;"> ${pDTO.p_Content } </span>
		   	</p>
		   	<p class ="goods_price">
		   		<fmt:formatNumber value="${pDTO.p_Price }" /><span class="won"> 원</span>
		   	</p>
		   	<div class ="goods_content">
		   		<dl>
		   			<dt>판매자</dt>
		   			<dd> ${m_Id }</dd>
		   		</dl>
		   		<dl>
		   			<dt>등록일</dt>
		   			<dd>${pDTO.p_Regdate }</dd>
		   		</dl>
		   		<dl>
		   			<dt>조회수</dt>
		   			<dd>${pDTO.p_Hit }</dd>
		   		</dl>
		   		<dl>
		   			<dt style="width: 120px;">안내글</dt>
		   			<dd style="font-size: 13px;">
		   			스팸성 홍보 등의 게시글 도배 및 댓글 도배 행위는 금지합니다.
		   			거래 제한 품목 등록 시 게시글 무통보 삭제 및 카페 이용제재 처리됩니다.
		   			</dd>
		   		</dl>
		   	</div>
		   	<div class="group_btn">
		   		<c:if test="${mDTO.m_No eq 1}">
		                  	<input type="hidden" name="p_No" value="${pDTO.p_No }" />
		                  	<input type="hidden" name="b_No" value="${pDTO.b_No }" />
		                  	<input type="button" value="삭제" onclick="fn_delete(this.form)" />
		                  	<c:if test="${pDTO.p_State eq 2 }">
		                  		<input type="button" value="승인" onclick="fn_agree(this.form)" />
		                  		<input type="button" value="승인취소" onclick="fn_cancle(this.form)" />
		                  	</c:if>
		                  </c:if>
		                  <input type="hidden" name="p_No" value="${pDTO.p_No }" />
		                  <input type="hidden" name="m_No" value="${mDTO.m_No }" />
		                  <input type="hidden" name="m_Id" value="${mDTO.m_Id }" />
		                  <input type="hidden" name="p_Price" value="${pDTO.p_Price }" />
		                  <c:if test="${pDTO.s_No ne mDTO.m_No and mDTO.m_No ne 1 and not empty mDTO}">
		                  	<input id ="buy" type="button" value="구매" onclick="fn_Buy(this.form)" />
		                 <!--  	<input type="button" value="장바구니" onclick="fn_cart(this.form)" /> -->
		                  </c:if>
		                  <c:if test="${empty mDTO }">
		                  	<input type="button" value="로그인" onclick="location.href='loginPage'" />
		                  </c:if>
		                  <c:if test="${pDTO.s_No eq mDTO.m_No and mDTO.m_No ne 1}">
		                  	<input type="hidden" name="p_No" value="${pDTO.p_No }" />
		                     <input type="hidden" name="p_Name" value="${pDTO.p_Name }" />
		                     <input type="hidden" name="p_Content" value="${pDTO.p_Content }" />
		                     <input type="hidden" name="p_Price" value="${pDTO.p_Price }" />
		                     <input type="hidden" name="p_Img_Path" value="${pDTO.p_Img_Path }" />
							<c:if test="${pDTO.p_State eq 1}">
                                 <input type="button" value="수정" onclick="fn_update(this.form)"  style ="width: 100px"/>
                              </c:if>		                  	
                              <input type="button" value="삭제" onclick="fn_delete(this.form)" style ="width: 100px"/>
		                  </c:if>
		                  <input id="back" type="button" value="돌아가기" onclick="location.href='productListPage'" />
		   	</div>
   	</div>
   </div>
      
	<%--  <table border="1">
         <thead>
            <tr>
               <td>
                  상품명 : ${pDTO.p_Name }<br/>
                  판매자 : ${m_Id } &nbsp;&nbsp;&nbsp;&nbsp; 
                  등록일 : ${pDTO.p_Regdate }
               </td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>
                  <img alt="${pDTO.p_Img_Path }" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"><br/><br/>
                  가격 : <fmt:formatNumber value="${pDTO.p_Price }" />원<br/><br/>
                  내용 : ${pDTO.p_Content }<br/><br/>
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td>
                  <c:if test="${mDTO.m_No eq 1}">
                  	<input type="hidden" name="p_No" value="${pDTO.p_No }" />
                  	<input type="button" value="삭제" onclick="fn_delete(this.form)" />
                  	<c:if test="${pDTO.p_State eq 2 }">
                  		<input type="button" value="승인" onclick="fn_agree(this.form)" />
                  	</c:if>
                  </c:if>
                  <input type="hidden" name="p_No" value="${pDTO.p_No }" />
                  <input type="hidden" name="m_No" value="${mDTO.m_No }" />
                  <input type="hidden" name="m_Id" value="${mDTO.m_Id }" />
                  <input type="hidden" name="p_Price" value="${pDTO.p_Price }" />
                  <c:if test="${pDTO.s_No ne mDTO.m_No and mDTO.m_No ne 1 and not empty mDTO}">
                  	<input type="button" value="구매" onclick="fn_Buy(this.form)" />
                  	<input type="button" value="장바구니" onclick="fn_cart(this.form)" />
                  </c:if>
                  <c:if test="${empty mDTO }">
                  	<input type="button" value="로그인" onclick="location.href='loginPage'" />
                  </c:if>
                  <c:if test="${pDTO.s_No eq mDTO.m_No and mDTO.m_No ne 1}">
                  	<input type="hidden" name="p_No" value="${pDTO.p_No }" />
                     <input type="hidden" name="p_Name" value="${pDTO.p_Name }" />
                     <input type="hidden" name="p_Content" value="${pDTO.p_Content }" />
                     <input type="hidden" name="p_Price" value="${pDTO.p_Price }" />
                     <input type="hidden" name="p_Img_Path" value="${pDTO.p_Img_Path }" />
                  	<input type="button" value="수정" onclick="fn_update(this.form)" />
                  	<input type="button" value="삭제" onclick="fn_delete(this.form)" />
                  </c:if>
                  <input type="button" value="돌아가기" onclick="location.href='productListPage'" />
               </td>
            </tr>
         </tfoot>
      </table> --%>
   </form>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>