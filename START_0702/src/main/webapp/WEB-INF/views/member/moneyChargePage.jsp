<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<style type="text/css">
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
/* table{border-top : 1px solid gray;  border-collapse: collapse; width: 800px; margin: auto;}
th, td{border-top:1px solid gray;} */
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
/* .button{position: relative; left: 250px; padding-bottom: 10px;} */
.content{margin: 0 auto; padding-left: 40%; }

dl{display:flex; }
</style>

<script type="text/javascript">
	function fn_Charge(f) {
		
		if(f.m_Money.value == '' || isNaN(f.m_Money.value)) {
			swal("오류", "올바른 금액을 입력해주세요.", "error"); // warning", "error", "success", "info"
			return;
		}
		
		f.action='moneyCharge';
		f.submit();
		
	}
</script>
<div class ="main-menu"> 

<p class ="subtitle">충전하기</p>  <br>
<p style ="color: gray; margin: 0 auto;">충전하실 금액을 입력해주세요<br><br><p>
<form method="post" class="form">
	<div class ="content">
		<dl>
			<dt>충전금액</dt>
			<dd><input type="text" name="m_Money" /></dd>
			<dd>
				<input type="button" value="충전하기" onclick="fn_Charge(this.form)" />
				<input type="hidden" name="m_No" value="${mDTO.m_No }" />
			</dd>
		</dl>
	</div>
	<%-- <form method="post">
	<div>
		충전금액 <input type="text" name="m_Money" /><br/>
		<input type="hidden" name="m_No" value="${mDTO.m_No }" />
		<input type="button" value="충전하기" onclick="fn_Charge(this.form)" />
	</div> --%>
</form>	
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>