<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.annotation.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="regi.css">
</head>
<body>
    <div id="page-wrap">
        <form method="post" action="member.jsp">
            <fieldset>
                <legend>회원정보입력</legend>
                <label for="name">아이디</label>
                <input type="text" name="id" />
                <button>중복검사</button><br />
                <label for="password1">패스워드</label>
                <input type="password" name="password" /><br />
                <label for="password2">패스워드 확인</label>
                <input type="password" name="passwordcheck" /><br />
                <label for="name">이름</label>
                <input type="text" name="name" /><br />
                <label for="dob">생일</label>
                <input type="date" name="birth" />
                <br />
                <label for="email">이메일</label>
                <input type="email" name="email" />
                <br />
                <label for="tel">휴대폰 번호</label>
                <input type="tel" name="phone" />
                <br />
            </fieldset>
            <input type="submit" name="submit" value="제출" />
            <input type="reset" name="reset" value="초기화" />
        </form>
    </div>
</body>
</html>
