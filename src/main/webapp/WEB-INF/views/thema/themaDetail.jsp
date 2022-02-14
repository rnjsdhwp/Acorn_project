<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:url var="urlHome" value="/"/>
<%@ page session="false" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/top.css" rel="stylesheet">
<style>
th,td {padding:1px 20px;}
</style>
	<title>ThemaDetail</title>
</head>
<body>
	<div align="center">
	
	<table id="1" >
	 
		<tr align="center" ><!-- 첫번째 줄 시작 -->
		    
		    <c:forEach  items="${detailLst }" var="detail" varStatus="status" >
	
		<c:if test="${status.index%3==0}">
		<tr></tr>
		</c:if>

		    <td>    
			     
		 	      <a href="${urlHome }region/detail?title=${detail.title}" class="">   
		          <figure>
		              <img src="${path }/${detail.img }" align="middle" alt="">
		            <figcaption> 
		              <h3 >${detail.title }</h3>
		              <p>${detail.location }</p>
		              <span style="color:#00a599">${detail.title1 }</span> 
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
