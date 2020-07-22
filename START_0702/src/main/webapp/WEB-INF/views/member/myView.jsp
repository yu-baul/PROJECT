<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" /> 
<!-- 주소API 포함 -->
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
   function myViewUpdate(f) {

      if (f.m_Pw.value == '') {
		 swal("필수", "비밀번호는 필수입니다.", "warning"); // warning", "error", "success", "info"
         f.m_Pw.focus();
         return;
      }

      if (f.m_Pw.value != f.m_Pw2.value) {
		 swal("오류", "비밀번호를 확인하세요.", "error"); // warning", "error", "success", "info"
         f.m_Pw2.focus();
         return;
      }

      f.action = 'myViewUpdate';
      f.submit();

   }
   
   	   function myViewDelete(f) {
		
	      if(confirm('정말로 회원탈퇴 하시겠습니까?')){
				  
		    	  f.action = 'myViewDeletePage';
		          f.submit();
	      }
	     
	   }
   
   $(document)
         .ready(
               function() {

                  // 1. 비밀번호 체크
                  //    8 ~ 20 사이의 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.
                  //    각각 1개 이상 포함해야 한다.
                  var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;

                  $('#m_Pw')
                        .keyup(
                              function() {
                                 if (regExpPW.test($('#m_Pw').val())) {
                                    $('#pwCheckResult').text(
                                          '비밀번호 사용 가능합니다.');
                                    $('#pwCheckResult').css(
                                          'color', 'blue').css(
                                          'font-weight', 'bold');
                                 } else {
                                    $('#pwCheckResult')
                                          .text(
                                                '4~20자, 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');
                                    $('#pwCheckResult').css(
                                          'color', 'red');
                                 }
                              });

                  $('#m_Pw2').keyup(
                        function() {
                           if ($('#m_Pw').val() != $('#m_Pw2').val()) {
                              $('#pwConfirmResult').text(
                                    '비밀번호가 일치하지 않습니다.');
                              $('#pwConfirmResult').css('color',
                                    'red');
                           } else {
                              $('#pwConfirmResult').text(
                                    '비밀번호가 일치합니다.');
                              $('#pwConfirmResult').css('color',
                                    'blue').css('font-weight',
                                    'bold');
                           }
                        });

                  // 2. 입력 초기화
                  $('#clearBtn').click(
                        function() {
                           $('input[type=text], input[type=password]')
                                 .each(function() {
                                    //  각 요소는 each 문 내부에서 $(this) 로 호출한다.
                                    $(this).val('');
                                 });
                           $('span').each(function() {
                              $(this).text('');
                           });
                           $('#m_Pw').focus();
                        });

               });

   // 주소 API
   function execDaumPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if (data.buildingName !== '' && data.apartment === 'Y') {
                  extraAddr += (extraAddr !== '' ? ', '
                        + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if (extraAddr !== '') {
                  extraAddr = ' (' + extraAddr + ')';
               }
               // 조합된 참고항목을 해당 필드에 넣는다.
               document.getElementById("m_Address").value = data.zonecode
                     + " / " + addr + " " + extraAddr;

            } else {
               document.getElementById('m_Address').value = data.zonecode
                     + " / " + addr;
            }

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("m_Address").focus();
         }
      }).open();
   }
</script>

<style type="text/css">
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
input[type =text] ,input[type =password] {width: 250px; padding: 3px; margin: 5px 10px; }
.content{margin: auto; padding-left: 40%; }
 table{outline: 1px solid gray; outline-offset: 10px; border-collapse: collapse; width: 600px; margin: auto;}
/* th, td{border:1px solid gray; } */
dl{display:flex; }
</style>

<div class ="main-menu"> 

	<p class ="subtitle">마이페이지</p>  <br>
	
	<form method="post">
	
	   <table>
	   <colgroup>
		<col style="width:30%;">
		<col style="width:70%;">
	</colgroup>
	      <tbody>
	      	<tr>
	      		<td style ="height:20px;">
	      	</tr>
	         <tr>
	            <td ><label for="m_Id">아이디</label></td>
	            <td><input type="text" name="m_Id" id="m_Id"
	               value="${mDTO.m_Id }" readonly /><br /></td>
	         </tr>
	         <tr>
	            <td colspan="2"><span id="idCheckResult"></span>
	            <td>
	         </tr>
	         <tr>
	            <td><label for="m_Pw">비밀번호</label></td>
	            <td><input type="password" name="m_Pw" id="m_Pw" /><br /></td>
	         </tr>
	         <tr>
	            <td colspan="2"><span id="pwCheckResult"></span></td>
	         </tr>
	         <tr>
	            <td><label for="m_Pw2">비밀번호 확인</label></td>
	            <td><input type="password" name="m_Pw2" id="m_Pw2" /><br />
	            <td>
	         </tr>
	         <tr>
	            <td colspan="2"><span id="pwConfirmResult"></span></td>
	         </tr>
	         <tr>
	            <td><label for="m_Name">성명</label></td>
	            <td><input type="text" name="m_Name" id="m_Name"
	               value="${mDTO.m_Name }" readonly /></td>
	         </tr>
	         <tr>
	            <td></td>
	         </tr>
	         <tr>
	            <td><label for="m_Phone">전화번호</label></td>
	            <td><input type="text" name="m_Phone" id="m_Phone"
	               value="${mDTO.m_Phone }" readonly /><br /></td>
	         </tr>
	         <tr>
	            <td colspan="2"><span id="phoneCheckResult"></span></td>
	         </tr>
	         <tr>
	            <td><label for="m_Email">이메일</label></td>
	            <td><input type="text" name="m_Email" id="m_Email"
	               value="${mDTO.m_Email }" readonly /><br /></td>
	         </tr>
	         <tr>
	            <td colspan="2"><span id="emailCheckResult"></span></td>
	         </tr>
	         <tr>
	            <td><label for="m_Address">주소</label></td>
	            <td>
		            <input type="text" name="m_Address" id="m_Address" value="${mDTO.m_Address }" style= "width: 180px" />
		            <input type="button" onclick="execDaumPostcode()" value="우편번호">
	            </td>
	         </tr>
	         <tr>
	            <td>잔액</td>
	            <td  style ="padding-right: 176px"><fmt:formatNumber value="${mDTO.m_Money }" />원</td>
	         </tr>
	         <tr>
	            <td colspan="2" style ="height:50px;"><input type="button" value="수정하기"
	               onclick="myViewUpdate(this.form)" /> 
	            <input type="button" value="회원탈퇴" onclick="myViewDelete(this.form)" />
	             <!--   <input type="reset" id="clearBtn" value="다시 작성" /> --></td>
	         </tr>
	      </tbody>
	   </table>
	</form>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>