<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
   
   function fn_noticeUpdate(f){
      if(confirm('수정하시겠습니까?')){
         f.action = 'NoticeUpdate';
         f.submit();
      }
   }
   function fn_noticeDelete(f){
      if(confirm('삭제하시겠습니까?')){
         f.action = 'NoticeDelete';
         f.submit();
      }
   }
   
</script>

<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<style type="text/css">

table{border-top : 1px solid gray;  border-collapse: collapse; width: 600px; margin: auto;}
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
.list_order{text-align:center; }
.order_stuff{border: 1px solid gray; width: 600px; margin: 10px 0px 0px; padding: 0px 30px;position: relative; left:30%; top:0px; }
.member{/* display: flex; */ margin:auto; /* border-top: 1px solid gray; */ padding: 14px 0px 20px; border:1px solid black; width: 800px;}
.admin{/* display: flex; */ margin:auto; /* border-top: 1px solid gray; */ padding: 14px 0px 20px; border:1px solid black; width: 800px;}
 dl{display: flex; margin:auto; text-align: center; padding: 20px;} 
.name{font-size: 20px; text-align: left; padding: 5px;}
.pic, .desc{padding: 5px; }
dl > dt {padding: -1px 20px 4px 10px; width: 50px;}
content{text-align: center; margin:auto; }
dl.head{display: flex;}

input[type =button]  {background-color: rgb(195, 214, 155);  border: none;  color: white;
  padding: 5px 5px;  text-align: center;  text-decoration: none;
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
input[type =text]  {width: 400px; height: 30px; padding: 10px;}
</style>
<br/></br>
<div class ="main-menu"> 
   <p class="subtitle">공지사항</p>  <br>
<%-- 
      제목 : ${nDTO.n_Title } 
      내용 : {nDTO.n_Content} --%>
      
            
            <!--  loginDTO가 null 일때 ! -->
            <c:if test="${empty mDTO }">
            <div class ="member">
               <dl class="head">
                  <dt>제목</dt>
                  <dd> ${nDTO.n_Title }</dd>
                  <dt style ="padding-left: 15%;">등록일</dt>
                  <dd > ${nDTO.n_Date }</dd>
               </dl>
               <dl >
                  <dt>내용</dt>
                  <dd style ="width: 700px;"> ${nDTO.n_Content}</dd>
               </dl>
              
                 <br>
               <%-- 내용 : {nDTO.n_Content}    <br>
               등록일 : ${nDTO.n_Date } <br> --%>
               <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
            
            </div>
               
            </c:if>
            
            <!--  loginDTO가 null 이 아닐때 ! -->
            <c:if test="${not empty mDTO and mDTO.m_State eq 1 }">
               <div class ="member">
               <dl class="head">
                  <dt>제목</dt>
                  <dd> ${nDTO.n_Title }</dd>
               </dl>
               <dl>
                  <dt>내용</dt>
                  <dd style ="width: 700px; text-align: left;"> ${nDTO.n_Content}</dd>
               </dl>
               <dl>
                  <dt >등록일</dt>
                  <dd> ${nDTO.n_Date }</dd>
               </dl>
                 <br>
               <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
               </div>   
              </c:if>
              <c:if test="${not empty mDTO and mDTO.m_State eq 2 }">
               <c:choose>
                  
                  <%-- <c:when test="${mDTO.m_State eq 1}">
                     제목 : ${nDTO.n_Title }  <br>
                     내용 : {nDTO.n_Content}    <br>
                     등록일 : ${nDTO.n_Date } <br>
                  
                  
                  </c:when> --%>
               <c:when test="${mDTO.m_State eq 2}">
                  <div class ="admin">
                   <form method="post">
                   <dl class="head">
                     <dt>제목</dt>
                     <dd> <input type="text" name="n_Title" value="${nDTO.n_Title }" width="500px" /></dd>
                     <dt style ="padding-left: 5%;">등록일</dt>
                     <dd style ="padding-left: 2%;">${nDTO.n_Date }</dd>
                  </dl>
                  <dl>
                     <dt style="width: 50px;">내용</dt>
                     <dd > <textarea name="n_Content" style ="width: 700px; height: 200px;"  >${nDTO.n_Content }</textarea></dd>
                  </dl>
                 
                    <br>
                    <input type="hidden" name="n_No" value="${nDTO.n_No }" />
                    <input type="button" value="수정하기" onclick="fn_noticeUpdate(this.form)" />
                     <input type="button" value="삭제하기" onclick="fn_noticeDelete(this.form)" />
                     <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
                     </form>
                  </div>
                 
                  <%--  <form method="post">
                     <input type="hidden" name="n_No" value="${nDTO.n_No }" />
                     제목 :  /><br/><br/>
                     내용 : <br/><br/>
                     등록일 : <input type="text" name="n_Date" value="${nDTO.n_Date }" readonly /><br/><br/>
                  </form>
                     <input type="button" value="수정하기" onclick="fn_noticeUpdate(this.form)" />
                     <input type="button" value="삭제하기" onclick="fn_noticeDelete(this.form)" />
                     <input type="button" value="목록으로" onclick="location.href='NoticePage'" /> --%>
                  </c:when>
                  
                  <%--  <c:when test="${mDTO.m_State eq 2}"> 
                   <form method="post">
                     <input type="hidden" name="n_No" value="${nDTO.n_No }" />
                     제목 : <input type="text" name="n_Title" value="${nDTO.n_Title }" /><br/><br/>
                     내용 : <textarea name="n_Content" rows="10" cols="30">${nDTO.n_Content }</textarea><br/><br/>
                     등록일 : <input type="text" name="n_Date" value="${nDTO.n_Date }" readonly /><br/><br/>
                  </form>
                     <input type="button" value="수정하기" onclick="fn_noticeUpdate(this.form)" />
                     <input type="button" value="삭제하기" onclick="fn_noticeDelete(this.form)" />
                     <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
                  </c:when> --%>
               </c:choose>
            </c:if>

   
   
   <%-- <form method="post">
         <input type="hidden" name="n_No" value="${nDTO.n_No }" />
         제목 : <input type="text" name="n_Title" value="${nDTO.n_Title }" /><br/><br/>
         내용 : <textarea name="n_Content" rows="10" cols="30">${nDTO.n_Content }</textarea><br/><br/>
         등록일 : <input type="text" name="n_Date" value="${nDTO.n_Date }" readonly /><br/><br/>
            
            <!--  loginDTO가 null 일때 ! -->
            <c:if test="${empty mDTO }">
               <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
            </c:if>
            
            <!--  loginDTO가 null 이 아닐때 ! -->
            <c:if test="${not empty mDTO }">
               <c:choose>
                  
                  <c:when test="${mDTO.m_State eq 1}">
                     <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
                  </c:when>
                  
                  <c:when test="${mDTO.m_State eq 2}">
                     <input type="button" value="수정하기" onclick="fn_noticeUpdate(this.form)" />
                     <input type="button" value="삭제하기" onclick="fn_noticeDelete(this.form)" />
                     <input type="button" value="목록으로" onclick="location.href='NoticePage'" />
                  </c:when>
      
               </c:choose>
            </c:if>
   </form>    --%>
</div>         
<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>










