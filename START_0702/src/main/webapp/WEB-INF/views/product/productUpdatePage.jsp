<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="../template/header.jsp" />
<style type="text/css">
.subtitle{font-weight: bold; color:#5F7D95; font-size: 28px;}
.inner_view {display:flex; margin:auto; width: 1000px;}
.left-wrap{text-align: left; padding:50px 40px 0 0; margin: 0 0 0 50px;}
strong.name {padding: 0 100px 10px 0;  width: 200px;}

.group_btn{margin: 40px 60px 10px 100px;}
/* .goods_price{border-bottom: 1px solid gray; padding: 5px 10px 10px 0; font-size: 28px; } */
.won{font-size: 15px;}

div.goods_content dl{display: flex;/*  padding: 10px 0px; */ }
dl > dt {padding: 0px 20px 0px 0px; }
dl{margin: 7px;}

input[type =button], #buy  { background-color:rgb(195, 214, 155);   border: none;  color: black;
  padding: 5px 5px;    text-decoration: none; width: 100px; height: 45px; 
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }
#back  {/* background-color:rgb(195, 214, 155); */  border: 2px solid rgb(195, 214, 155);  color: black;
background-color: white;
  padding: 5px 5px;    text-decoration: none; width: 100px; height: 45px; 
  display: inline-block; font-size: 13px;  margin: 4px 2px;  cursor: pointer; }  
  #img_location{ position:absolute;  padding-left: 1px;}
</style>


<script type="text/javascript">

   function fn_update(f) {

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
          swal("필수", "상품의 이미지를 등록해주세요.", "warning"); // warning", "error", "success", "info"
         return;
      }
      if (isNaN(f.p_Price.value)) {
          swal("오류", "금액은 숫자만 가능합니다.", "error"); // warning", "error", "success", "info"
         return;
      }
     var imgpath = f.p_Img_Path.value.slice(-3);  /* 업로드 파일 확장자명 확인 */
     if(imgpath != 'jpg' && imgpath != 'png' && imgpath != 'JPG' && imgpath != 'PNG'){
           swal("오류", "이미지가 아닌 파일은 등록할 수 없습니다.", "error"); // warning", "error", "success", "info"
        return;
     }


      f.action = 'productUpdate';
      f.submit();
   }
   
</script>

<div class ="main-menu"> 
<p class ="subtitle">상품 수정하기</p>  <br>


<form enctype="multipart/form-data" method="post">
    <div class ="inner_view"> 
      <div class="right-wrap">
            <div class ="img">
               <img alt="${pDTO.p_Img_Path }" width= "450px" height="400px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }">
                <input type="file" name="p_Img_Path" />
               <%-- <img alt="${pDTO.p_Img_Path }" width= "450px" height="400px" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }"> --%>
            </div>
         </div>
   
       <div class="left-wrap">
       <p  style ="padding: 10px 0px;"> 카테고리 <select name="p_Cartegory" >
                  <option value="">카테고리 선택</option>
                  <option value="fashion">패션</option>
                  <option value="digital">디지털</option>
                  <option value="food">식품</option>
                  <option value="book">도서</option>
                  <option value="sports">스포츠</option>
                  <option value="music">음반</option>
               </select>
        </p>
         <p class ="goods_name" >상품명  <input type="text" name="p_Name" value="${pDTO.p_Name }" width ="350px;" />
            
            
               <%-- <Strong class ="name" style="font-size: 20px;"> ${pDTO.p_Name } </Strong> --%>
            
             
            <p class ="short_desc"  style="font-size: 14px; padding: 4px 60px 10px 0; padding: 10px 0px;"> <br>
         상품 설명 <textarea rows="10" cols="50" name="p_Content">${pDTO.p_Content }</textarea>
          </p>
            </p>
            <p class ="goods_price">
               가격 <input type="text" name="p_Price" value="${pDTO.p_Price }" /><span class="won"> 원</span>
            </p>
            <div class="group_btn">
                <input type="hidden" name="p_No" value="${pDTO.p_No }" />
                  <input type="button" value="수정" onclick="fn_update(this.form)" />
            
            </div>
       </div>  
    </div>  
</form>       
     <%--   <table border="1" >
         <tbody>
            <tr>
              <td>상품명</td>
               <td><input type="text" name="p_Name" value="${pDTO.p_Name }" /></td>
            </tr>
            <tr>
               <td>카테고리</td>
               <td>
                  <select name="p_Cartegory" >
                  <option value="">카테고리 선택</option>
                  <option value="fashion">패션</option>
                  <option value="digital">디지털</option>
                  <option value="food">식품</option>
                  <option value="book">도서</option>
                  <option value="sports">스포츠</option>
                  <option value="music">음반</option>
               </select> 
               </td>
            </tr>
            <tr>
               <td>내용</td>
               <td>
                  <textarea rows="10" cols="50" name="p_Content">${pDTO.p_Content }</textarea>
               </td>
            </tr>
            <tr>
               <td>가격</td>
               <td><input type="text" name="p_Price" value="${pDTO.p_Price }" /></td>
            </tr>  
            <tr>
               <td>이미지</td>
               <td>
                  
                 
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="2">
                  <input type="hidden" name="p_No" value="${pDTO.p_No }" />
                  <input type="button" value="수정" onclick="fn_update(this.form)" />
               </td>
            </tr>
         </tfoot>
      </table>-->

   </form>



<%-- <form enctype="multipart/form-data" method="post">
   
      <table border="1" >
         <tbody>
            <tr>
               <td>상품명</td>
               <td><input type="text" name="p_Name" value="${pDTO.p_Name }" /></td>
            </tr>
            <tr>
               <td>카테고리</td>
               <td>
                  <select name="p_Cartegory" >
                  <option value="">카테고리 선택</option>
                  <option value="fashion">패션</option>
                  <option value="digital">디지털</option>
                  <option value="food">식품</option>
                  <option value="book">도서</option>
                  <option value="sports">스포츠</option>
                  <option value="music">음반</option>
               </select>
               </td>
            </tr>
            <tr>
               <td>내용</td>
               <td>
                  <textarea rows="10" cols="50" name="p_Content">${pDTO.p_Content }</textarea>
               </td>
            </tr>
            <tr>
               <td>가격</td>
               <td><input type="text" name="p_Price" value="${pDTO.p_Price }" /></td>
            </tr>
            <tr>
               <td>이미지</td>
               <td>
                  <img alt="${pDTO.p_Img_Path }" src="${pageContext.request.contextPath }/resources/storage/${pDTO.p_Img_Path }">
                  <input type="file" name="p_Img_Path" />
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td colspan="2">
                  <input type="hidden" name="p_No" value="${pDTO.p_No }" />
                  <input type="button" value="수정" onclick="fn_update(this.form)" />
               </td>
            </tr>
         </tfoot>
      </table>

   </form> --%>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="../template/footer.jsp" %>