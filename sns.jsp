<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.annotation.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link type="text/css" rel="stylesheet" href="sns.css">
</head>
<body id = "body1">
    <header>
        <h1><a href = "sns.jsp">My SNS</a></h1>
    </header>
    <section id="main">
        <article id="article1">
          <iframe name="iframe" src="posts.jsp"></iframe>
        </article>
      </section>
      <aside id="right">
        <div id="login">
          <h4>Log In</h4>
          <form name="'input" action="login.jsp" method = "get">
            아이디
            <input type="'text" name="id"><br />
            패스워드
            <input type="password" name="password"><br />
            <input type="submit" value="로그인" />
            <input type="reset" value="초기화" /><br />
            <a href="register.jsp" target="_self" id="register">회원가입</a>
          </form>
        </div>
        </aside>
        <footer>my sns</footer>
</body>
</html>
