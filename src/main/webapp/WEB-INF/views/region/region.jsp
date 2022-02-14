<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<c:url var="urlHome" value="/"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	$(".select").change(function(){
        var selected = $(this).val();
        console.log(selected);
/*         alert($(this).children("option:selected").text()); */
        $("#frm").attr("action", "${urlHome }index?formPath=region?selected="+selected+"");
		$("#frm").submit();
	});
	
	
})
</script>

<html>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/top.css" rel="stylesheet">
<head>
<style>
th,td {padding:1px 20px;}

select {
	 text-align: center;
     width:150px;
     padding:5px;
     border:1px solid skyblue;
     background-color : #00ffff;
     font-family:'Nanumgothic';
     border-radius:3px;
     /* -webkit-appearance: none;
     -moz-appearance: none;  */
/*      appearance : none; */
}

</style>
	<title>Home</title>
</head>

<body>
<br>

<div align="center">
	
    <br>
   
  <table>
  
  	<tr>
  	<td valign="top">
  	<br>
 <form id="frm" action="${urlHome }index?formPath=region" method="post">
  	<div class="btn-group">
  <select class="select" >
		<option>서울특별시</option>
		<option>강남구</option>
		<option>종로구</option>
		<option>성북구</option>
		<option>중랑구</option>
		<option>동대문구</option>
		<option>중구</option>
		<option>용산구</option>
		<option>강북구</option>
		<option>도봉구</option>
		<option>서초구</option>
	</select>
  
</div>
<br>
<br>
	<div class="btn-group">
  <select class="select" >
 		<option>경기도</option>
		<option>김포시</option>
		<option>고양시</option>
		<option>부천시</option>
		<option>구리시</option>
		<option>안양시</option>
		<option>하남시</option>
		<option>의정부시</option>
		<option>성남시</option>
		<option>광주시</option>
		<option>이천시</option>
		<option>남양주시</option>
		<option>수원시</option>
	</select>
</div>
<br>
<br>
	<div class="btn-group">
  <select class="select" >
  		<option>강원도</option>
		<option>철원군</option>
		<option>화천군</option>
		<option>양구군</option>
		<option>춘천시</option>
		<option>인제군</option>
		<option>고성군</option>
		<option>속초시</option>
		<option>양양군</option>
		<option>강릉시</option>
		<option>원주시</option>
		<option>홍천군</option>
		<option>평창군</option>
		<option>정성군</option>
		<option>영월군</option>
		<option>동해시</option>
		<option>태백시</option>
		<option>삼척시</option>
	</select>
</div>
</form>
  	</td>
  	<td>
	  <table id="1" >
	 
		<tr align="center" ><!-- 첫번째 줄 시작 -->
		    
		    <c:forEach  items="${detailLst }" var="detail" varStatus="status" >
	
		<c:if test="${status.index%3==0}">
		<tr></tr>
		</c:if>

		    <td>    
			     
		 	      <a href="${urlHome }region/detail?title=${detail.title}" class="">   
		          <figure>
		              <img src="${detail.img }" align="middle" alt="">
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
	    </td>
	</tr>
	
</table>  
</div>
</body>
</html>
