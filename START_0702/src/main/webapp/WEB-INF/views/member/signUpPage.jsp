<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<!-- AJAX 포함 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소API 포함 -->
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	var emailauth = '';
	var authKey = '';
	var id = 0 ; /* 1이상이면 가입 불가 */
	var phone = 0;
	var email = 0;
	var pw = 0;
	var pw2 = 0;
	
   function signUp(f) {

      if (f.m_Id.value == '') {
		 swal("필수", "아이디는 필수입니다.", "warning"); // warning", "error", "success", "info"
         f.m_Id.focus();
         return;
      }
      if (id != 0 ){
		  swal("오류", "아이디를 확인하세요.", "error"); // warning", "error", "success", "info"
    	  f.m_Id.focus();
    	  return;
      }
      if (f.m_Pw.value == '') {
		 swal("필수", "비밀번호는 필수입니다.", "warning"); // warning", "error", "success", "info"
         f.m_Pw.focus();
         return;
      }
      if (f.m_Name.value == '') {
		 swal("필수", "성명은 필수입니다.", "warning"); // warning", "error", "success", "info"
         f.m_Name.focus();
         return;
      }
      
      if (f.m_Phone.value == '') {
 		 swal("필수", "전화번호는 필수입니다.", "warning"); // warning", "error", "success", "info"
         f.m_Phone.focus();
         return;
       }
      
      if (f.m_Pw.value != f.m_Pw2.value) {
		 swal("오류", "비밀번호를 확인하세요.", "error"); // warning", "error", "success", "info"
         f.m_Pw2.focus();
         return;
      }
      if (emailauth != 'YES'){
		  swal("필수", "이메일인증은 필수입니다.", "warning"); // warning", "error", "success", "info"
    	  f.m_Email.focus();
    	  return;
      }
      
      if (email != 0 ){
		  swal("오류", "이메일을 확인하세요.", "error"); // warning", "error", "success", "info"
    	  f.m_Email.focus();
    	  return;
      }
      
      if (phone != 0 ){
		  swal("오류", "전화번호를 확인하세요.", "error"); // warning", "error", "success", "info"
    	  f.m_Phone.focus();
    	  return;
      }
      if (pw != 0 ){
		  swal("오류", "비밀번호를 확인하세요.", "error"); // warning", "error", "success", "info"
    	  f.m_Pw.focus();
    	  return;
      }
     
      

      f.action = 'signUp';
      f.submit();

   }

   $(document)
         .ready(
               function() {

                  // 1. 아이디 중복 체크
                  //    5 ~ 20 사이의 소문자나 숫자를 사용한다. 첫 글자는 소문자이다.
                  var regExpID = /^[a-z][a-z0-9]{4,19}$/; // 첫 글자는 소문자이다.(^[a-z]+)

                  $('#m_Id')
                        .keyup(
                              function() {
                                 $
                                       .ajax({
                                          url : 'IdCheck',
                                          type : 'POST',
                                          dataType : 'JSON',
                                          data : 'm_Id='
                                                + $('#m_Id')
                                                      .val(),
                                          success : function(
                                                responseObject) {
                                             // 정규식 test()
                                             if (regExpID
                                                   .test($(
                                                         '#m_Id')
                                                         .val())) { // 정규식을 만족하면,
                                                // 가입된 아이디인지 여부 확인
                                                if (responseObject.result == 'EXIST') {
                                                   $(
                                                         '#idCheckResult')
                                                         .text(
                                                               '이미 가입된 아이디입니다.');
                                                   $(
                                                         '#idCheckResult')
                                                         .css(
                                                               'color',
                                                               'gray');
                                                   id++;
                                                   
                                                } else {
                                                   $(
                                                         '#idCheckResult')
                                                         .text(
                                                               '사용할 수 있는 아이디입니다.');
                                                   $(
                                                         '#idCheckResult')
                                                         .css(
                                                               'color',
                                                               'blue')
                                                         .css(
                                                               'font-weight',
                                                               'bold');
                                                   id = 0;
                                                }
                                             } else { // 정규식을 만족하지 않으면
                                                $(
                                                      '#idCheckResult')
                                                      .text(
                                                            '5~20자, 소문자시작, 소문자+숫자 가능');
                                                $(
                                                      '#idCheckResult')
                                                      .css(
                                                            'color',
                                                            'gray');
                                                id++;
                                             }
                                          },
                                          error : function() {
                                    		  swal("오류", "AJAX 통신이 실패했습니다.", "error"); // warning", "error", "success", "info"
                                          }
                                       });
                              });

                  // 2. 비밀번호 체크
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
                                    pw = 0;
                                 } else {
                                    $('#pwCheckResult')
                                          .text(
                                                '4~20자, 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');
                                    $('#pwCheckResult').css(
                                          'color', 'gray');
                                    pw++;
                                 }
                              });

                  $('#m_Pw2').keyup(
                        function() {
                           if ($('#m_Pw').val() != $('#m_Pw2').val()) {
                              $('#pwConfirmResult').text(
                                    '비밀번호가 일치하지 않습니다.');
                              $('#pwConfirmResult').css('color',
                                    'gray');
                              
                           } else {
                              $('#pwConfirmResult').text(
                                    '비밀번호가 일치합니다.');
                              $('#pwConfirmResult').css('color',
                                    'blue').css('font-weight',
                                    'bold');
                            
                           }
                        });

                  // 3. 이메일

                  var regExpEMAIL = /^[a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;

                  $('#m_Email')
                        .keyup(
                              function() {
                                 $
                                       .ajax({
                                          url : 'EmailCheck',
                                          type : 'POST',
                                          dataType : 'JSON',
                                          data : 'm_Email='
                                                + $('#m_Email')
                                                      .val(),
                                          success : function(
                                                responseObject) {
                                             // 정규식 test()
                                             if (regExpEMAIL
                                                   .test($(
                                                         '#m_Email')
                                                         .val())) {
                                                // 가입된 이메일 여부 확인
                                                if (responseObject.result == 'EXIST') {
                                                   $(
                                                         '#emailCheckResult')
                                                         .text(
                                                               '이미 가입된 이메일입니다.');
                                                   $(
                                                         '#emailCheckResult')
                                                         .css(
                                                               'color',
                                                               'red');
                                                   email++;
                                                } else {
                                                   $(
                                                         '#emailCheckResult')
                                                         .text(
                                                               '사용할 수 있는 이메일입니다.');
                                                   $(
                                                         '#emailCheckResult')
                                                         .css(
                                                               'color',
                                                               'blue')
                                                         .css(
                                                               'font-weight',
                                                               'bold');
                                                   email = 0 ;
                                                }
                                             } else { // 정규식을 만족하지 않으면
                                                $(
                                                      '#emailCheckResult')
                                                      .text(
                                                            '올바른 이메일 형식이 아닙니다.');
                                                $(
                                                      '#emailCheckResult')
                                                      .css(
                                                            'color',
                                                            'red');
                                                email++;
                                             }
                                          },
                                          error : function() {
                                    		  swal("오류", "AJAX 통신이 실패했습니다.", "error"); // warning", "error", "success", "info"
                                          }
                                       });

                              });

                  // 4. 전화번호(핸드폰)
                  var regExpPHONE = /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;

                  $('#m_Phone')
                        .keyup(
                              function() {
                                 $
                                       .ajax({
                                          url : 'PhoneCheck',
                                          type : 'POST',
                                          dataType : 'JSON',
                                          data : 'm_Phone='
                                                + $('#m_Phone')
                                                      .val(),
                                          success : function(
                                                responseObject) {
                                             // 정규식 test()
                                             if (regExpPHONE
                                                   .test($(
                                                         '#m_Phone')
                                                         .val())) {
                                                // 가입된 전화번호 여부 확인
                                                if (responseObject.result == 'EXIST') {
                                                   $(
                                                         '#phoneCheckResult')
                                                         .text(
                                                               '이미 가입된 전화번호입니다.');
                                                   $(
                                                         '#phoneCheckResult')
                                                         .css(
                                                               'color',
                                                               'red');
                                                   phone++;
                                                } else {
                                                   $(
                                                         '#phoneCheckResult')
                                                         .text(
                                                               '사용 가능한 번호입니다.');
                                                   $(
                                                         '#phoneCheckResult')
                                                         .css(
                                                               'color',
                                                               'blue')
                                                         .css(
                                                               'font-weight',
                                                               'bold');
                                                   phone = 0;
                                                }
                                             } else { // 정규식을 만족하지 않으면
                                                $(
                                                      '#phoneCheckResult')
                                                      .text(
                                                            '올바른 전화번호 형식이 아닙니다.');
                                                $(
                                                      '#phoneCheckResult')
                                                      .css(
                                                            'color',
                                                            'red');
                                                phone++;
                                             }
                                          },
                                          error : function() {
                                    		  swal("오류", "AJAX 통신이 실패했습니다.", "error"); // warning", "error", "success", "info"
                                          }
                                       });
                                 if (regExpPHONE.test($('#m_Phone')
                                       .val())) {
                                    $('#phoneCheckResult').text(
                                          '사용 가능한 번호입니다.');
                                    $('#phoneCheckResult').css(
                                          'color', 'blue').css(
                                          'font-weight', 'bold');
                                    phone = 0;
                                 } else {

                                 }
                              });

                  // 5. 입력 초기화
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
                           $('#m_Id').focus();
                        });
                  
                  // 6. 이메일 인증
        			$('#m_EmailAuth').click(function(){
        				
        				if($('#m_Email').val() == ''){
                    		  swal("필수", "이메일을 입력해주세요.", "warning"); // warning", "error", "success", "info"
        				}else {
        					
  	      				$.ajax({
  	      					url: 'emailAuth',
  	      					type: 'GET',
  	      					data: 'm_Email='+$('#m_Email').val(),
  	      					dataType: 'json',
  	      					success: function(responseObj){
  	      						authKey =  responseObj.authKey ;
                        		  swal("성공", "이메일을 보냈습니다.", "success"); // warning", "error", "success", "info"
  	      					},
  	      					error: function(){
                      		  swal("오류", "없는 이메일입니다.", "error"); // warning", "error", "success", "info"
  	      					}
  	      				});
        					
        				}
        			
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
   
	
   
   // 이메일 인증 확인
   function fn_emailAuthComfirm(f){
	   
	  	   
	   if (f.m_Email_authKey.value ==''){
   		  swal("필수", "인증코드를 입력하세요.", "warning"); // warning", "error", "success", "info"
		   f.m_Email_authKey.focus();
	   }else if ( authKey != f.m_Email_authKey.value){
   		  swal("오류", "잘못된 인증코드 입니다.", "error"); // warning", "error", "success", "info"
		   emailauth = 'NO';
		   return;
	   }else {
   		  swal("성공", "인증되었습니다.", "success"); // warning", "error", "success", "info"
		   emailauth = 'YES';
	   }
   }
   
</script>

<style type="text/css" >
input[type =button]  {background-color: rgb(195, 214, 155);   border: rgb(195, 214, 155);   color: black;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
  
form {width: 600px; margin:auto; border :1px solid gray; padding: 10px;}
.signIn-head {display: flex; margin:auto; width:600px;}
.login-title, .singin-title {width:50%;  padding: 10px 20px; margin: 8px 0; }
.login-title:hover , .singin-title:hover {/* font-weight: bold; */ text-decoration: underline;}
input[type =button]  {background-color:rgb(195, 214, 155);  border: none;  color: black;
  padding: 5px 5px;    text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
input[type=text], input[type=password], #signUpBtn{
	width: 50%; 
	padding: 5px 5px; margin: 5px 0; display:inline-block; 
	box-sizing: border-box;
}
label{color: gray; }
.area{margin:auto; text-align: left; padding-left: 150px;}

#m_Email{width: 38%;}
</style>
<div class ="main-menu"> 
<div class ="signIn-head">
	<div class ="login-title"><a href="loginPage">로그인</a></div>
	<div class ="singin-title"  style ="font-weight: bold" ><a href="signUpPage">회원가입</a></div>
</div>
<form method="post">
  
   <div >
       <p class ="area"><label for="m_Id">* 아이디</label></p>
       <div>
       		<input type="text" name="m_Id" id="m_Id" placeholder="id" value="${mDTO.m_Id }"/><br />
       </div>
       		<span id="idCheckResult"></span>
     </div> 
      <div>
       <p class ="area"><label for="m_Pw">* 비밀번호</label></p>
       <div>
       		<input type="password" name="m_Pw" id="m_Pw" placeholder="4~20자 대소문자, 숫자 특수문자 포함" value="${mDTO.m_Pw }"/><br />
       </div>
       		<span id="pwCheckResult"></span>
     </div> 
      <div>
       <p class ="area"><label for="m_Pw2">* 비밀번호확인</label></p>
       <div>
       		<input type="password" name="m_Pw2" id="m_Pw2" value="${mDTO.m_Pw }" /><br />
       </div>
       		<span id="pwConfirmResult"></span>
     </div> 
      <div  >
       <p class ="area"><label for="m_Name">* 성명</label></p>
       <div>
       		<input type="text" name="m_Name" id="m_Name" value="${mDTO.m_Name }"/><br />
       </div>
       		
     </div> 
      <div  >
       <p class ="area"><label for="m_Phone">* 전화번호</label></p>
       <div>
       		<input type="text" name="m_Phone" id="m_Phone" value="${mDTO.m_Phone }"/><br />
       </div>
       		<span id="phoneCheckResult"></span>
     </div>
      <div >
       <p class ="area"><label for="m_Email">* 이메일</label></p>
       <div>
       		<input type="text" name="m_Email" id="m_Email" value="${mDTO.m_Email }"/>
       		<input type="button" id="m_EmailAuth" value="인증요청" >
       		<br />
       		<input type="text" name="m_Email_authKey" id="m_Email">
       		<input type="button" value="인증하기" onclick="fn_emailAuthComfirm(this.form)">
       </div>
       		<span id="emailCheckResult"></span>
     </div> 
      <div >
       <p class ="area"><label for="m_Address">주소</label></p>
       <div>
       		<input type="text" name="m_Address" id="m_Address" style ="width : 200px;" value="${mDTO.m_Address }"/>
       		<input type="button" id ="button" onclick="execDaumPostcode()" value="우편번호 찾기">
       </div>
       		<span id="emailCheckResult"></span>
     </div> 
     <h5 style = "color :gray;"> * 는 필수입력란 입니다.</h5><br>
     <input type="button" id="signUpBtn"value="가입하기" onclick="signUp(this.form)" />
   
</form>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>