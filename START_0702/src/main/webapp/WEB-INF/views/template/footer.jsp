<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	
	/* a{text-decoration: none; color: grey; margin: 0 10px;} */
	
	/*  ul, li{margin: 0; padding: 0; list-style: none; font-size: 14px;} */
	
	/*  .bottom{border-top: 2px solid black; position: absolute; bottom:0; left:0; right:0;  width: 100%; top: 130%; left: 0; padding-bottom: 0;}  */
	/* .bottom{border-top: 2px solid black; border-bottom:2px solid black;  margin-top:600px; position: absolute; width: 100%; height: 200px; top: 100%; left: 0; padding-bottom: 0;} */
	
	footer.foot-menu > ul , li{margin: 0; padding: 0; list-style: none; font-size: 14px;}
	footer.foot-menu> ul > li{display: inline-block; padding-left: 10px; 
	padding-right: 10px; position: relative; width: 350px;}
	footer.foot-menu > ul{height: 340px;}
	footer.foot-menu  > ul > li > ul{position: absolute; top: 100%;}
	/* footer{text-align: center; padding-top: 50px;  border-top: 2px;} */
	#con > li{text-align: left; padding-bottom: 10px}  
	footer.foot-menu, .push{heigth: 200px;  border-top: 2px solid rgb(195, 214, 155);}
	
	.foot-menu{text-align: center; margin: 10px; padding: 20px; }
/* 	#con{display: inline-block;} */
	
/* footer{ position:fixed; 
  left:0px; 
  bottom:0px; 
  height:200px; 
  width:100%;
  border-top: 2px solid black; }
 */
 /* footer{ position:fixed; 
  left:0px; 
  bottom:0px; 
  height:200px; 
  width:100%;
  border-top: 2px solid black; }
 */
</style>
<script type="text/javascript">

	$(function(){
		stickyFooter();

		$(window).scroll(stickyFooter).resize(stickyFooter);
	});


	function stickyFooter(){
		document_height = $(document).height(); // 문서 전체 높이
		document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
		window_height = $(window).height(); // 창 높이
		footer_height = $("footer").height();

		gap = document_height - footer_height - window_height; 
		bottom = document_scrollTop - gap ; 

		if(document_scrollTop > gap){
			$("footer").css("bottom", bottom+"px");
		}else{
			$("footer").css("bottom","0");
		}
	}

</script>
	

		<footer class="foot-menu"> 
		<ul id ="con" style="height: 100px">
			<li>고객센터
					<ul>
						<li style ="font-size: 30px; font-style:bold;">1588-1111</li>
						<li>주중 : 9:00am ~ 6:00pm</li>
						<li>점심시간: 1:00am ~ 2:00pm</li>
					</ul>
			</li>		
			<li>상호명: Owner_la
				<ul>
					<li>ⓒ 2020 Owner_la. All right reserved</li>
					<li>이용약관 |  개인정보처리방침 | 운영정책</li>
				</ul>
			</li>
			
		</ul>	
		</footer>
	
</body>
</html>