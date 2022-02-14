<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:url var="urlHome" value="/"/>
<!DOCTYPE html> 
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/forgot.css" rel="stylesheet">
    <title>아이디/비밀번호 찾기</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">

    	$(document).ready(function(){
    		$("#findid").on("click",function(){
    			$("#emailgo").submit();
    		});
    		
    	})
    	$(document).ready(function(){
    			$("#findpw").on("click",function(){
        			$("#emailgo2").submit();
        		});
    	})
    </script>
</head>

<body>
    <center>
        <div class="start">
            <!-- 아이디찾는 부분 -->
            <h2>아이디 찾기</h2>
            <hr>
            <form class="row g-3" action="${urlHome }membership/findId" id="emailgo" method="POST">
                <div class="col-8">
                    <label for="inputEmail4" class="form-label">이메일</label>
                    <input type="email" class="form-control" name="email" id="inputEmail4" placeholder="이메일 주소">
                </div>
                <div class="col-2" id="btn1">
                    
                    <input type="button" value="전송" id="findid" class="btn btn-danger">
                </div>
            </form>

            <!-- 비번찾는 부분 -->
            <form class="row g-3" id="find-pw" action="${urlHome }membership/findPw" method="POST" id="emailgo2">
                <h2>비밀번호 찾기</h2>
                <hr>
                <div class="col-8">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" placeholder="아이디" id="id" name="id">
                </div>
                <div class="col-8">
                    <label for="inputEmail4" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="inputAddress2" name="email" placeholder="이메일 주소">
                </div>
                <div class="col-2" id="btn2">
                    <button id="findpw" class="btn btn-danger">전송</button>
                </div>
            </form>
            <form action="${urlHome }index?formPath=login">
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-danger">로그인 화면으로</button>
            </div>
        </form>
        
        </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>