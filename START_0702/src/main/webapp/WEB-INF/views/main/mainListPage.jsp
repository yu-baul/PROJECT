<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<jsp:include page="../template/header.jsp" />

<table border="1">

      <tbody>
         <c:if test="${empty pDTO }">
            <tr>
               <td colspan="3">공지사항이 없습니다.</td>
            </tr>
         </c:if>
         <c:if test="${not empty pDTO }">
            <tr>
            	<c:forEach var="pDTO" items="${pDTO }">
               
                	<td>
                		<a href="mainViewPage?p_No=${pDTO.p_No }"><img alt="" src="${pDTO.p_Img_Path }"></a><br/>
                	</td>
               
            	</c:forEach>
            </tr>
         </c:if>
      </tbody>
      <tfoot>
         
      </tfoot>

</table>


<%@ include file="../template/footer.jsp" %></body>