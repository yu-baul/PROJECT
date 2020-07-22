<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Noto+Sans+KR&family=Open+Sans&display=swap" rel="stylesheet">
<title>OWNER-LA</title>

    <meta charset="UTF-8">
    <meta name=viewport content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="resources/css/jquery.slidein.css">
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script> 
    <script type="text/javascript" src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="resources/css/jquery.slidein.js"></script>
    <script type="text/javascript">

        $(document).ready (function ()  
        {
            $("#mypanel").slidein ({ peek: 0, open: false, speed: 500, opacity: 0.9 });  
        });

    </script>
    
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}
.header{ background-color: rgb(195, 214, 155); 
background-image: linear-gradient(to bottom, rgb(223, 232, 201), rgb(195, 214, 155))
}
.main-menu {
	width: 100%;
	background-color: white;
	text-align: center;
	padding: 50px;
	font-family: 'Montserrat', sans-serif;
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Open Sans', sans-serif;
}
/* .wrap, .header-wrap, .main-wrap  .footer-wrap  {
		box-sizing: border-box;
		text-align: center;
	} */
/* html,body{ width:100%; margin:0; padding:0; } */

/* .wrap{display: flex; min-height: 100vh; flex-direction: column;} */
/* .main-content{ flex: 1; } footer{ height:60px; background: #333; color:#fff; } */

/* .wrap {min-hegith:100%; left:0px; margin: auto; } */

/* .header-wrap {
		height: 100px;
		text-align: right;
		padding: 20px;
		display: flex;
		box-shadow: 0 4px 8px rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.02);
	} */

/* Style the topnav links */
.
topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 15px 15px;
	margin-left: 15px;
	text-decoration: none;
}
/* Change color on hover */
.top-size:hover {
	background-color: #194d30;
	color: white;
}

div.header-right-wrap>div.logo {
	margin: auto;
}
/* .main-wrap {
		/* height: 800px; 
		margin: auto;
		padding: 50px 0;
	} */

/* .footer-wrap {
		padding: 20px;
		margin-top:50px;
		height: 50px;
	} */
/* .header-left-wrap {text-align: left; width: 30%;} */
/* 	.header-center-wrap {text-align: center;width: 40%;} */
.header-right-wrap {
	text-align: right;
	width: 80%;
	padding: 20px;
	25
	px;
}

a {
	text-decoration: none;
	color: none;
}
/* table, td {
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
		
	}
	
	table {
		margin: auto;
		margin-top: 50px;
	} 
	.ft{
		background: lightgreen;
	}
	
	 유바울 */
.main-myview-cartegory {
	display: flex;
	text-align: center;
	margin: auto;
}

.main-myview-cartegory>div {
	text-align: center;
}

.myPage-tap {
	width: 60%;
	display: flex;
	list-style: none;
	margin: auto;
	text-align: center;
}
/* 이지은 */
/* .product-wrap{display:flex; 	border: 1px solid black;   }
   	.product-wrap >.product-left-wrap{ width: 50%;  border: 1px solid black; float: left;}
   	.product-wrap >.product-right-wrap{	width: 50%; border: 1px solid black; float:right; padding: 5px 5px;  } */
ul {
	list-style-type: none;
}

a {
	text-decoration: none;
	color: #5F7D95;
}

li.top-size {
	width: 150px;
	padding: 10px;
}

.mypanel>ul {
	height: 300px;
	margin-top: 50px;
}

.mypanel li {
	padding-top: 10px;
	margin-right: 10px;
}

.dropbtn {
	border: none;
	background-color: black;
	color: white;
	display: inline-block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font: inherit;
	margin: 0;
}

.dropdown-content {
	display: block;
	display: none;
	position: absolute;
	z-index: 1;
	width: 3000px;
	height: 10px;
	left: 0;
	background-color: light-gray;
}

.column a {
	float: none;
	color: black;
	padding: 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.column {
	float: left;
	width: 16%;
	padding: 3px 0px 3px 0px;
	background-color: rgba(195, 214, 155, 0.76);
	height: 45px;
	margin: 0px 60px 60px 500px;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
	font-family: Arial, Helvetica, sans-serif;
	padding-left: 27%;
	height: 50px;
}

.topnav a {
	float: left;
	text-align: center;
	padding: 14px 15px;
	text-decoration: none;
}

#nav_title {
	padding: 14px 40px;
	color: white;
}
</style>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://image.closetshare.com/StaticContentFront/new/js/plugins/dockPanel-1.0.0.js?ver=1.848"></script> -->
<script type="text/javascript">
$('#account_data').click(function(){
	window.dataLayer = window.dataLayer || [];
	var data ={
		event:"MyInfo"
	}
	dataLayer.push(data);
})
function showMyPage(){
	$('.side-mask').show();
	$('#panelMenu').dockPanel('show');
		
}
(function($){

    var defaultSettings = {
        dock: 'right'
    };
    

    var _initPanel = function(elements, settings){
        var dock = settings.dock;
        if(dock == 'left' || dock == 'right') {
            $.each(elements, function(index, el) {
                var width = $(el).width();
                $(el).css({
                    'position': 'fixed',
                    'overflowX': 'hidden',
                    '[dock]': '(-width) + "px"',
                    'top':'0',
                    'bottom':'0',
                    'width': 'width + "px"'
                });
            });
        }
        else {
            $.each(this, function(index, el) {
                var height = $(el).height();
                $(el).css({
                    'position': 'fixed',
                    'overflowY': 'hidden',
                    'left': '0',
                    'right': '0',
                    '[dock]':'(-height)+"px"'
                });
            });
        }
        
        $.each(elements, function(i,val){
            $(val).data('docking', settings.dock);
        });
    }


    var _showPanel = function(el, callback){
        console.log('show');
        $(el).show();
        var docking = $(el).data('docking');
        $(el).animate({'[docking]': '0px'}, 'fast', callback);
    };

    var _hidePanel = function(el, callback){
        console.log('hide');
        var docking = $(el).data('docking');
        var width = $(el).width();
        var height = $(el).height();
        if(docking == 'left' || docking == 'right') {
            $(el).animate({'[docking]': (-width) + 'px'}, 'fast', callback);
        }
        else {
            $(el).animate({'[docking]': (-height) + '0px'}, 'fast', callback);
        }
    };


$.fn.dockPanel = function() {

    if(arguments.length == 0 || typeof(arguments[0])=='object') {
        var settings = $.extend({}, defaultSettings, arguments[0]);
        _initPanel(this, settings);
    }
    else if(arguments.length>0 && typeof(arguments[0])=='string') {
        var callback = arguments.length>1 && typeof(arguments[1]=='function') ? arguments[1] : function(){};
        $.each(this, function(i, el){
            switch(arguments[0]) {
                case 'show': 
                    _showPanel($(el), callback);
                    break;
                case 'hide':
                    _hidePanel($(el), callback);
                    break;
            }
        });
    }
}
})(jQuery);


</script>
</head>
<body>
	 

	<div class ="header">
			<div class="header-right-wrap">
				<!--  loginDTO가 null 일 때! -->
					<c:if test="${empty mDTO }">
						<a href ="loginPage" >로그인</a>
						<!--  <input type="button" value="로그인" onclick="location.href='loginPage'">  -->
					</c:if>
					
					<!--  loginDTO가 null 이 아닐때 ! -->
					<c:if test="${not empty mDTO }">
						<c:choose>
						
							<c:when test="${mDTO.m_State eq 1}">
								${mDTO.m_Name } 오너님 환영합니다.<br/>
								<!-- <input type="button" value="내정보" onclick="location.href='myView'"> -->
								<!-- <input type="button" value="로그아웃" onclick="location.href='logout'"> -->
								<!-- <a href ="javascript:showMyPage();">
									<span id ="account_data">
										<i class ="">내정보</i></span>
								</a> -->
								<div class ="mypanel" id="mypanel">
									<ul>
										<li><a href="cartList?m_Id=${mDTO.m_Id }" class ="datalayer" data-event="cart"><img src ="<%=request.getContextPath() %>/resources/img/cart1.png" alt> 장바구니</a></li>
										<li><a href="productBuyList?m_No=${mDTO.m_No }" class ="datalayer" data-event="buy"><img src ="<%=request.getContextPath() %>/resources/img/buy.png" alt> 구매현황</a></li>
										<li><a href="productSellList?m_No=${mDTO.m_No }"class ="datalayer" data-event="sell" ><img src ="<%=request.getContextPath() %>/resources/img/sell.png" alt> 판매현황</a></li>
										<li><a href="qnaViewPage?m_No=${mDTO.m_No }" class ="datalayer" data-event="qna"><img src ="<%=request.getContextPath() %>/resources/img/qna.png" alt> 1:1문의</a></li>
										<li><a href="productInsertPage" class ="datalayer" data-event="qna"><img src ="<%=request.getContextPath() %>/resources/img/enroll.png" alt>상품등록</a></li>
										<li><a href="moneyChargePage?m_No=${mDTO.m_No }"><img src ="<%=request.getContextPath() %>/resources/img/money.png" alt>충전하기</a></li>
										<li><a href="myView"><img src ="<%=request.getContextPath() %>/resources/img/myPage.png" alt> 마이페이지</a></li>
										<li><a href ="logout"><img src ="<%=request.getContextPath() %>/resources/img/logout.png" alt> 로그아웃</a></li>
										<li style= "color:#5F7D95;">잔액 : <fmt:formatNumber value="${mDTO.m_Money }" />원</li>
										<li style= "color:#5F7D95;">나의등급 : ${mDTO.m_Grade }</li>
									</ul>
								</div>
							</c:when>
							
							<c:when test="${mDTO.m_State eq 2}">
								${mDTO.m_Name }님 환영합니다.<br/>
								<!-- <input type="button" value="회원관리" onclick="location.href='memberView'">
								<input type="button" value="상품관리" onclick="location.href='product'">
								<input type="button" value="내정보" onclick="location.href='myView'">
								
								
								<input type="button" value="로그아웃" onclick="location.href='logout'"> -->
								<div  class ="mypanel" id="mypanel">
									<ul>
									<%-- 	<li><a href="productBuyList?m_No=${mDTO.m_No }" class ="datalayer" data-event="buy"><img src ="<%=request.getContextPath() %>/resources/img/buy.png" alt> 구매현황</a></li>
										<li><a href="productSellList?m_No=${mDTO.m_No }" class ="datalayer" data-event="sell" ><img src ="<%=request.getContextPath() %>/resources/img/sell.png" alt> 판매현황</a></li> --%>
										<li><a href="memberView" class ="datalayer" data-event="qna"><img src ="<%=request.getContextPath() %>/resources/img/list.png" alt>회원관리</a></li>
										<li><a href="productManagementPage" class ="datalayer" data-event="qna"><img src ="<%=request.getContextPath() %>/resources/img/gift.png" alt>상품관리</a></li>
										<li><a href="qna_qAdminViewPage" class ="datalayer" data-event="qna"><img src ="<%=request.getContextPath() %>/resources/img/qna.png" alt> 1:1문의</a></li>
										<%-- <li><a href="myView"><img src ="<%=request.getContextPath() %>/resources/img/myPage.png" alt> 마이페이지</a></li> --%>
										<li><a href ="logout"><img src ="<%=request.getContextPath() %>/resources/img/logout.png" alt> 로그아웃</a></li>
									</ul>
								</div>
							</c:when>
							
						</c:choose>
					</c:if>
				</div>
				<div class="logo" >
					<h1 style ="text-align: center;">
						<a href="home">
							<img alt ="owner_la_logo" src ="resources/img/logoo.png" width="300px" >
						</a>
					</h1>
				</div>		
			
	
		 
	
	</div>
	<div class ="topnav">
		 	<a id ="nav_title" href="NoticePage">공지사항</a>
		 	<div class ="dropdown">
		 	<button class="dropbtn" >구매하기</button>
		 		<div class="dropdown-content">
		 			<div class ="column">
					 	<a href="productListPage">전체</a>
						<a href="productCartegory?p_Cartegory=fashion">패션</a>
						<a href="productCartegory?p_Cartegory=digital">디지털</a>
						<a href="productCartegory?p_Cartegory=food">식품</a>
						<a href="productCartegory?p_Cartegory=book">도서</a>
						<a href="productCartegory?p_Cartegory=sports">스포츠</a>
						<a href="productCartegory?p_Cartegory=music">음반</a>
					</div>
				</div>
			</div>
			<c:if test="${mDTO.m_State eq 1 }">
				<a id ="nav_title"   style="padding-left:400px;"  href="productInsertPage">판매하기</a>
			</c:if>
		</div>
			
		
	
