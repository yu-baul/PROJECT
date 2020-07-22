<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />

<style type="text/css">

input[type =button]{background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
table{color:gray; border-collapse: collapse; width: 600px; margin: auto;}
th, td{padding:10px;}
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
.path{text-align: right; position: absolute; top:30%; right:18%;}

</style>
<script type="text/javascript">
	function fn_ProductInsert(f) {
		if(confirm('상품을 등록하시겠습니까?')){

			if (f.p_Name.value == '') {
		        swal("필수", "상품명은 필수항목입니다.", "warning"); // warning", "error", "success", "info"
				return;
			}
	
			if (f.p_Cartegory.value == '') {
		         swal("필수", "상품의 카테고리를 입력해주세요.", "warning"); // warning", "error", "success", "info"
				return;
			}
	
			if (f.p_Price.value == '') {
		         swal("필수", "가격은 필수항목입니다.", "warning"); // warning", "error", "success", "info"
				return;
			}
	
			if (f.p_Img_Path.value == '') {
		         swal("필수", "상품의 이미지를 입력해주세요.", "warning"); // warning", "error", "success", "info"
				return;
			}
			
			var imgpath = f.p_Img_Path.value.slice(-3);  /* 업로드 파일 확장자명 확인 */
			if(imgpath != 'jpg' && imgpath != 'png' && imgpath != 'JPG' && imgpath != 'PNG'){
		         swal("오류", "이미지가 아닌 파일은 등록할 수 없습니다.", "error"); // warning", "error", "success", "info"
				return;
			}
			
	
			if (isNaN(f.p_Price.value)) {
		        swal("오류", "금액은 숫자만 가능합니다.", "error"); // warning", "error", "success", "info"
				return;			
			}
			
			f.action = 'productInsert';
			f.submit();
		
	 	}
	}

</script>
<div class ="main-menu"> 
<form method="post" enctype="multipart/form-data" >
	<p class ="subtitle">상품등록</p>  <br>
	<p style ="color: gray">판매하고 싶은 상품의 사진과 내용을 작성해서 등록하세요.<p><br><br>
	<table style="border: 1px solid  #5F7D95" >
		<tbody>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="p_Name" style ="width:350px"/></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td ><select name="p_Cartegory"  style ="width:350px"> 
						<option value="">카테고리 선택</option>
						<option value="fashion">패션</option>
						<option value="digital">디지털</option>
						<option value="food">식품</option>
						<option value="book">도서</option>
						<option value="sports">스포츠</option>
						<option value="music">음반</option>
				</select></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="p_Price" placeholder="숫자만 적어주세요" style ="width:350px"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="p_Content" placeholder ="내용에 상품의 상태를 적어주세요 예) 상급, 약간 사용감 있음, 새제품 등 "></textarea></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" id="button" name="p_Img_Path" /></td>
			</tr>
			</tbody>
			</table>
			<br>
				<input type="hidden" name="s_No" value="${mDTO.m_No }" />
				<input type="button" value="등록하기" onclick="fn_ProductInsert(this.form)" /></td>
	

</form>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>