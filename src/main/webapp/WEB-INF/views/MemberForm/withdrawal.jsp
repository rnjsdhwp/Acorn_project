<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:url var="urlHome" value="/"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html> 
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/withdrawal.css" rel="stylesheet">
    <title>회원탈퇴</title>
</head>

<body>
    <center>
        <div class="start">
            <!-- 아이디찾는 부분 -->
            <h2>회원 탈퇴</h2>
            <hr>
            <form class="row g-3" action = "${urlHome }membership/delete">
                <div>정말 탈퇴하시겠습니까?</div>
                <div>탈퇴를 원하신다면 아래 입력창에 "탈퇴"를 입력하시고 탈퇴하기 버튼을 클릭하세요.</div>
                <div class="col-12">
                    <input type="text" class="form-control" placeholder="탈퇴">
                </div>
                <div class="d-grid gap-2" style="margin-top: 50px;">
                    <button type="submit" class="btn btn-danger">탈퇴하기</button>
                </div>
                <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-danger" formaction="${urlHome }">홈으로</button>
            </div>
            </form>
            
        </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>