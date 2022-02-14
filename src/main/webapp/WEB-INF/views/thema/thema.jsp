<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<style>
th,td {padding:1px 20px;}
</style>
	<title>Thema</title>
</head>
<body>
	<div align="center">
		 <table id="1" >
	 
		<tr align="center" ><!-- 첫번째 줄 시작 -->
		    
		    <c:forEach  items="${ThemaLst }" var="Thema" varStatus="status" >
	
		<c:if test="${status.index%4==0}">
		<tr></tr>
		</c:if>

		    <td>    
			     
		 	      <a href="${urlHome }thema/detail?title=${Thema.thematitle}" class="">  
		          <figure>
		              <img src="${Thema.themaimg }" align="middle" alt="">
		            <figcaption> 
		              <h3 >${Thema.thematitle }</h3>
		             <p>${Thema.themacontents }</p>
		              <%-- <span style="color:#00a599">${Thema.title1 }</span> --%>
		            </figcaption>
		          </figure>
		        </a>
		        </td>
	
		       </c:forEach>
	        
		  
		</tr><!-- 세번째 줄 끝 -->
		
	    </table>
	</div>
</body>
</html>
