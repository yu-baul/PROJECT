<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<!-- AJAX 포함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소API 포함 -->

<script type="text/javascript">
	$(function(){ //전체선택 체크박스 클릭 
		$("#allCheck").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
			if($("#allCheck").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
				} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
					$("input[type=checkbox]").prop("checked",false); 
				} 
		}) 
	})

	function chk(f){
		 var req =  document.form.req.checked;
		 var req2 = document.form.req2.checked;
		 var num = 0;
		 
		
		 if((req == true) && (req2 == true)){
		  	 num = 1;
		 }else {
			 num = 0;
		 }
		 
		 if(num==1){
		  	f.action = 'signUpPage';
		    f.submit();
		 }else{
			swal("필수", "회원가입 약관의 내용에 동의하셔야합니다.", "warning"); // warning", "error", "success", "info"
		 }
	}
</script>

<style type="text/css" >
textarea {
    width: 600px;
    text-align: left;
}
input[type =button]  {background-color: rgb(195, 214, 155);   border: rgb(195, 214, 155);   color: black;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; width: 150px; }
  
form {width: 600px; margin:auto; border :1px solid gray; padding: 10px;}
.signIn-head {display: flex; margin:auto; width:600px;}
.login-title, .singin-title {width:50%;  padding: 10px 20px; margin: 8px 0; }
.login-title:hover , .singin-title:hover {text-decoration: underline;}
#button {background-color: #194d30;  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
/* input[type=text], input[type=password], #signUpBtn{
	width: 50%; 
	padding: 5px 5px; margin: 5px 0; display:inline-block; 
	box-sizing: border-box;
}
label{color: gray; }
.area{margin:auto; text-align: left; padding-left: 150px;}
.centered{margin:auto; text-align: center; font-weight: bold;} */
</style>
<div class ="main-menu"> 
<div class ="signIn-head">
	<div class ="login-title"><a href="#" onclick ="history.go(-1);">로그인</a></div>
	<div class ="singin-title" style ="font-weight: bold">회원가입</div>
</div>

<form name="form" method="post">
  	회원가입 및 정상적인 서비스 이용을 위해 아래 약관을 읽어 보시고, <br/>동의 여부를 결정해 주세요. <br/>

	<h5 style = "color :gray;"> 필수 약관을 동의 하셔야 회원가입이 가능합니다.</h5><br/><br/>
    
    <div >
       <p class ="centered">서비스 이용약관</p><br/>
       		<textarea rows="10" cols="300" style="overflow-x:hidden;overflow-y:auto">
[서비스 이용약관]

제1장 총 칙

제1조 (명칭)

본 사이트는 "Owner_La(오너라) 공식 홈페이지"로 칭하며 본 사이트의 운영주체는 Owner_La(오너라)입니다.

제2조 (목적)

본 약관은 회원들이 본 정보를 이용함에 있어 본 사이트와 가입 회원(이하 회원) 간의 관계 설정을 목적으로 합니다.

제3조 (약관의 변경)

본 사이트가 약관을 변경하고자 할 경우, 본 사이트는 변경된 내용을 시행예정 30일전까지 회원에게 통지함과 동시에 홈페이지 내의 공지 페이지에 공지하여야 하며 회원이 적용 예정일까지 이의를 제기하지 않을 경우에는 변경된 약관을 승인한 것으로 봅니다. 

회원이 이의를 제기한 때에는 본 사이트에 대하여 탈퇴의사를 밝힌 것으로 봅니다.
제4조 (본 약관에서 정하지 아니한 사항)

본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 관계법령 또는 상관례에 따릅니다.



제2장 회원의 가입 및 탈퇴

제5조 (회원)

본 사이트 회원이란 Owner_La(오너라)가 회원으로 적합하다고 인정하는 일반 개인으로서, 본 약관에 동의하고 Owner_La(오너라)가 인정하는 본 사이트의 회원가입양식을 작성한 뒤 고유의 ID와 PASSWORD를 발급 받은 자를 말합니다.

본 사이트에 기재하는 모든 정보는 이름을 포함하여 실제정보로 간주합니다. 그와 같이 입력하지 않는 사용자는 법적인 보호를 받을 수 없으며 본 사이트의 서비스 제한 조치를 받을 수 있습니다.

제6조 (가입과 탈퇴)

본 사이트에 가입을 희망하는 이용자는 본 사이트가 지정한 가입신청서를 작성하여야 하며, 본 사이트는 이용자의 가입 신청 시 개인정보 수집과 관련하여 반드시 회원의 동의를 받아야 합니다. 

제 1항의 경우, 가입을 희망하는 자가 본 사이트의 회원으로서 부적합 하다고 판단할 경우, 본 사이트는 가입신청을 거절할 수 있으며, 이 경우 부적격사유를 통보하여야 합니다. 

회원은 언제든지 본 사이트의 회원에서 탈퇴할 수 있습니다.
제7조 (회원자격의 정지 및 박탈)

본 사이트는 회원이 다음 각 호에 해당되는 경우, 당해 회원에게 소명의 기회를 부여한 후 회원의 자격을 일시 정지시킬 수 있습니다.

① 가입신청서의 기재사항을 허위로 작성할 경우

② 본 약관에서 정한 사항을 위반하는 경우

본 사이트가 제1항에 의하여 회원의 자격을 일시 정지시킨 후, 동일한 행위가2회 이상 반복되거나 또는 30일 이내에 그 사유가 시정되지 아니하는 경우, 본 사이트는 회원의 자격을 박탈할 수 있습니다.


제3장 서비스의 이용

제8조 (ID관리)

ID 및 비밀번호는 본 사이트와 협의 없이 타인에게 양도, 임대, 대여할 수 없으며, 회원ID와 비밀번호에 관한 모든 관리 책임은 회원에게 있습니다.
본 사이트는 회원ID에 의해 게시판 활동, 쇼핑 등 회원관리업무를 수행하며 본 사이트가 인정하는 정당한 사유가 없는 한 회원은 ID를 공유, 양도 또는 변경할 수 없습니다.
회원에게 부여된 ID 및 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
본 사이트는 회원과 관련된 개인 신상정보가 외부에 누출되지 않도록 보안에관련된 책임을 질 의무가 있습니다.

제9조 (서비스 이용제한)

이용자는 서비스의 이용에 있어서 다음 각 호에 해당되지 않도록 하여야 하며, 이에 해당되는 경우 서비스 이용을 제한할 수 있습니다.
① 공공질서 및 미풍양속(욕설, 비난 포함)에 반하는 경우

② 범죄적 행위에 관련되는 경우

③ 타인의 명예를 손상시키거나 불이익을 주는 경우

④ 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우


제4장 계약사항

제10조 (계약사항의 변경 및 해제)

이용자는 주소 등 이용계약 내용을 변경하거나, 서비스를 해지할 경우에는 본 사이트를 통해서 이용계약을 변경 및 해지하여야 합니다.

제11조 (면책조항)

본 사이트는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지않습니다.
본 사이트는 이용자가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은자료로 인한 손해에 관하여 책임을 지지 않습니다.

제12조 (저작권)

본 사이트에서 볼 수 있는 모든 자료는 Owner_La(오너라) 에서 본 사이트로만 제공하는 정보입니다.

[부칙]

본 약관은 2020년 1월 1일부터 시행합니다.
			</textarea>
			<input type="checkbox" name="req" value="true" id="req"/><label for="req">동의</label>
       <div>
       		<p class ="centered">개인정보 수집, 처리약관</p><br/>
       		<textarea rows="10" cols="300" style="overflow-x:hidden;overflow-y:auto">
   			[개인정보 수집, 처리약관]

Owner_La(오너라)의 개인정보보호정책

Owner_La(오너라)는 이용자 여러분의 개인정보를 보호하기 위해 개인정보보호정책을 수립하고 이를 준수합니다.

"Owner_La(오너라)의 개인정보보호정책"은 수시로 변경될 수 있습니다. 따라서 이용자 여러분께서는 예문사 사이트를 이용하실 때마다 수시로 이를 확인하시기 바랍니다.

개인정보란

생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.

Owner_La(오너라)는 서비스 제공에 필요한 최소한의 정보를 수집합니다.

필수사항
- 성명 
- 주소 
- 전화번호 
- 희망ID 
- 비밀번호 
- 이메일

Owner_La(오너라)에서 수집하는 개인정보는 다음에 명시한 목적으로만 이용됩니다.

- 회원가입 및 이용ID 발급 
- 계약의 성립 
- 개별 회원에 대한 개인 맞춤서비스 
- 회원의 서비스 이용에 대한 통계를 수집하고, 이를 서비스 정책에 반영
(서비스 개편 및 확대) 
- 상품 배송 
- 요금 및 대금 지급 
- 새로운 서비스, 신상품이나 이벤트 정보 안내

회원으로 가입할 때 수집된 모든 정보는 해당서비스 제공이나 회원님께 사전에 밝힌 목적 이외의 다른 어떠한 목적으로도 사용되지 않습니다.


제3자에 대한 정보제공

Owner_La(오너라)는 법령에 근거한 다음의 경우를 제외하고는 제3자에게 개인정보를 제공하지 않습니다.

- 금융실명거래및비밀보장에관한법률, 신용정보의이용및보호에관한법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자보호법, 한국은행법, 형사소송법 등 법령에 특별한 규정이 있는 경우(법령에 따라 행정관청 또는 수사기관이 요구해 온 경우라도 무조건 개인정보를 제공하지 않으며, 법령에 규정된 바에 따라 영장 또는 기관장의 직인이 날인된 서면에 의한 경우에만 제공합니다.) 
- 서비스 제공에 따른 요금정산을 위하여 필요한 경우

회원가입에 대한 동의 철회, 열람 또는 정정 요구 등

회원님께서는 "회원정보수정"을 통해 언제든지 개인정보에 대한 열람 및 수정을 할 수 있으며, 수정된 정보는 수정절차가 완료된 시점부터 바로 적용됩니다.

회원님께서는 "회원가입해지"를 통해 언제든지 회원가입에 대한 동의를 철회할 수 있습니다. 회원가입해지를 신청하시면, 해지신청 즉시 제공한 모든 정보를 삭제합니다.

수집하는 개인정보의 보유기간 및 이용기간

다음과 같이 개인정보의 수집 목적 또는 제공받은 목적이 달성되면, 개인정보를 파기합니다.
- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 때 
- 대금지급정보의 경우, 대금의 완제일 또는 채권소멸시효기간의 만료된 때 
- 배송정보의 경우, 물품 또는 서비스가 인도되거나 제공된 때 
(단, 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 예외로 합니다.)


쿠키(cookie)의 운영

쿠키(cookie)란?

웹 사이트 서버가 이용자의 컴퓨터로 전송하는 소량의 정보이며, 여기에는 방문한 웹 사이트의 정보 및 이용자의 개인정보 등이 담겨있습니다. 이용자는 웹 브라우저의 옵션을 조정함으로써 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수 있습니다. 


Owner_La(오너라)의 쿠키 운영

Owner_La(오너라)는 이용자의 편의를 위하여 쿠키를 운영합니다.
웹클래스가 쿠키를 통해 수집하는 정보는 예문사 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다. Owner_La(오너라)가 쿠키(cookie)를 통해 수집한 회원 ID는 아래의 목적을 위해 사용됩니다. 
1) Owner_La(오너라) 각종 정보 서비스 이용 시
2) 개인 맞춤 서비스 제공
3) 유료서비스 이용 시 이용기간 안내
4) 게시판 글 등록
쿠키는 브라우저의 종료 시나 로그아웃 시 만료됩니다.

개인정보 관리책임자

Owner_La(오너라) (02)1588-1111, owner_la2020@ownerla.com

한편, 회원님께서는 Owner_La(오너라)와 개인정보에 관한 분쟁이 있는 경우 신속하고 효과적인 
분쟁해결을 위하여 한국정보보호센터 내의 개인정보분쟁조정위원회에 그 처리를 의뢰할 
수 있습니다. 
- 개인정보침해신고센터 전화: 서울 1336, 지방(02)1336 
- 개인정보침해신고센터 URL: www.cyberprivacy.or.kr

개인정보보호정책 버전번호: v1.0
개인정보보호정책 시행일자: 2020-1-1
개인정보보호정책 게시일자: 2020-1-1

       		</textarea>
       		<input type="checkbox" name="req2" value="true" id="req2"/><label for="req2">동의</label>
       </div>
     </div> 
     
     <input type="checkbox" id="allCheck" name="req3" value="true"/><label for="allCheck">약관 전체 동의하기</form>
     <h5 style = "color :gray;"> 필수 약관을 동의 하셔야 회원가입이 가능합니다.</h5>
     <input type="button" id="signUpBtn" value="회원가입" onclick="chk(this.form)" />
   
</form>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp"%>