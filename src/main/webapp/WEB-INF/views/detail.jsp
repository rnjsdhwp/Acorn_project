<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<body>
<br>
<br>
<br>
<c:forEach items="${detailLst }" var= "detail">
	<h1>${detail.title }</h1>
	<br>
	<br>
<table align="center">

<tr>
<td width=70px;></td>
<td width=670px;><img src="${path }/${detail.img }" width=670px; alt=""></td>
<td width=70px;></td>

<td>
	<figcaption>
		<ul>
				<li id="stitle">
			<strong>요약 </strong>
				<br>
		 		<br><span>
				 ${detail.title1 }
				 </span>
			 	<br>
		 		<br>
		 		<br>
		 		<br>
			 </li>
			<li id="addr">
			<strong>위치 </strong>
			<br>
				 <span>
				 ${detail.location }
				 <a href="" class="get_nav">길찾기</a>
				 </span>
			 	<br>
	 			<br>
			 </li>
			<li id="tel"><strong>안내전화</strong> 
			<br><p>${detail.tel }</p>
			</li>
			<br>
		 	
			<li id="cost"><strong>입장료</strong>	
			<br><span>${detail.cost }</span>
			</li> 
			<br>
		
			<li id="hours"><strong>이용시간</strong> 	
			<br><span>${detail.hours }</span>
					</li>
				<br>
		 		<br>
			<li id="homepage"><strong>홈페이지</strong> <!--a href="www.narafestival.com" target="_system"-->
					<br><span>${detail.homepage }</span>
				<a href="${detail.homepage }"></a>
			</li>

			
		</ul>
	</figcaption>
	</td>
	<td width=50px;></td>
	</tr>
	</table>
	<br>
	<br>
	<br>
	<table>
	<tr>
	<td width=150px;></td>
	<td> 
	${detail.contents }
	</td>
	<td width=150px;></td>
	</tr>
	</table>
	</c:forEach>
</body>
</html>