<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 개인 1:1문의 페이지  -->

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />



<style type="text/css">
.main-menu{height: 500px;}
.title{font-weight: bold; color:#5F7D95; font-size: 28px; padding: 10px 0px 20px 5px;}
.content_title{text-align: left; }
.context-head{padding: 5px 5px; margin: 5px 0; display:inline-block; box-sizing: border-box; font-weight: bold;}
.context{padding: 5px 30px; margin: 5px 0;} 
input[type =submit],input[type =button]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
.top{text-align: left; font-size: 20px; color:#194d30; font-weight: bold; margin:auto; 
} 
form{color: #5F7D95;}
	#wrap{position: absolute; top:35%; left:30%;}
section{border: 1px solid #5F7D95; }

	

</style>

<script type="text/javascript">

	function fn_insert(f) {
	    
	    if (f.q_Cartegory.value == '' || f.q_Cartegory.value == 'null')  {
		   swal("필수", "문의분야를 입력해주세요.", "warning"); // warning", "error", "success", "info"
	       f.m_Id.focus();
	       return;
	    }
	    if (f.q_Title.value == '') {
		   swal("필수", "제목을 입력해주세요.", "warning"); // warning", "error", "success", "info"
	       f.m_Pw.focus();
	       return;
	    }
	    if (f.q_Content.value == '') {
	    swal("필수", "내용을 입력해주세요.", "warning"); // warning", "error", "success", "info"
	       return;
	    }
	    
	    f.action='qna_qUpdate';
	    f.submit();
	 }
 
</script>
<div class ="main-menu"> 
	<div id="wrap">
		<p class="title">1:1 문의 남기기</p>
		<section>
		
		<form >
			<div style="margin: auto; padding:20px;">
				<div class="context-head">
					 ${mDTO.m_Name } ( ${mDTO.m_Id } )
				</div>
			
				<div class ="context" >
					<!-- <h5 class="title">카테고리</h5>  -->
					
					<select name="q_Cartegory" style ="color: #5F7D95; width: 150px;">
						<option value="null">선택</option>
						<option value="회원">회원</option>
						<option value="구매&입찰">구매&입찰</option>
						<option value="판매">판매</option>
						<option value="상품정보요청">상품정보요청</option>
						<option value="기타">기타</option>
					</select>
				
					<!-- <h5 class="title">제목</h5> -->
					제목 <input type="text" name="q_Title" style="width: 300px; color:gray;">
				</div>
				<div class ="context">
					<p class="content_title">내용</p>
					<textarea rows="10" cols="70" name="q_Content" ></textarea>
				</div>
			
			<input type="hidden" name="m_No" value="${mDTO.m_No }">
			<input type="button" value="목록보기" onclick="location.href='qnaViewPage?m_No=${mDTO.m_No }'"> 
			<input type="button" value="등록하기" onclick="fn_insert(this.form)">
		</div>
		</form>
		</section>
	</div>
</div>
	<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	