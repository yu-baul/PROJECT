<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />


<style type="text/css">
input[type =button] , input[type =reset]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }

.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;} 
table{border-top : 1px solid gray;  border-collapse: collapse; width: 600px; margin: auto;}
th, td{border-top : 1px solid gray;  padding:10px;}
</style>

	<script type="text/javascript">
		
		function fn_register(f){
			if(f.n_Title.value == ''){
				swal("필수", "제목을 입력하세요.", "warning"); // warning", "error", "success", "info"
				f.n_Title.focus();
				return;
			}
			if(f.n_Content.value == ''){
				swal("오류", "내용을 입력하세요.", "error"); // warning", "error", "success", "info"
				f.n_Content.focus();
				return;
			}
			f.action = 'NoticeInsert';
			f.submit();
		}
		
	</script>

<br/></br>
<div class ="main-menu"> <br>
<p class="subtitle">공지사항</p>  <br>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<td>제목</td>
					<td><input type="text" name="n_Title"  style ="width : 350px;"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="n_Content" rows="10" cols="30" style ="width : 350px;"></textarea></td>
					
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="등록하기" onclick="fn_register(this.form)" />
						<input type="reset" value="다시 작성" />
						<input type="button" value="목록보기" onclick="location.href='NoticePage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>			
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>













