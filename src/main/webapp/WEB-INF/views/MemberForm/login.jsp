<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/"/>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="generator" content="Hugo 0.88.1">
    <title>로그인</title>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <script type="text/javascript">
   	
	$(document).ready(function(){
		var msg = $('#msg').val();
			
		if(msg=="등록되지 않은 이메일 입니다."){
			alert('등록되지 않은 이메일 입니다.')
		}else if(msg == "이메일 발송 완료"){
			alert('이메일 발송 완료')
		}else if(msg == "가입된 아이디가 없습니다."){
			alert('가입된 아이디가 없습니다.')
		}
	})
	
    </script>
	<c:if test=""></c:if>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
	
    

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
  
    </style>

    
    <!-- Custom styles for this template -->
    <link href="${path }/resources/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="${urlHome }login/loginProc" method="post">
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="id">
      <label for="floatingInput">id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pw">
      <label for="floatingPassword">Password</label>
    </div>
    <button class="w-100 btn btn-lg btn-danger" type="submit" id="login-btn">로그인</button>
    <div class="checkbox mb-3" id="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> 로그인상태 유지
      </label>
    </div>
    <p class="mt-5 mb-3 text-muted"><hr></p>
    <div class="find"><a href="${urlHome }index?formPath=forgot">아이디 / 비밀번호 찾기</a></div>
    <div class="join"><a href="${urlHome }index?formPath=membership" align="right">회원가입</a></div>
  	<input type="hidden" value="${msg }" name="msg" id="msg">
  </form>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>