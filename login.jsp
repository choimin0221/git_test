<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, javax.servlet.annotation.*" %>

<%
    // 로그인 처리 부분
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    boolean isValidUser = false;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        conn = (Connection) application.getAttribute("dbConn");

        // 쿼리 작성
        String sql = "SELECT * FROM users WHERE id = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(0, id);
        pstmt.setString(1, password);
        
        // 쿼리 실행
        rs = pstmt.executeQuery();

        if (rs.next()) {
            isValidUser = true;
            session.setAttribute("userId", id); // 세션에 사용자 ID 저장
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 자원 해제
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    if (isValidUser) {
%>
        <script>
            alert("로그인 성공!");
            window.location.href = "sns.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("로그인 실패: 아이디 또는 비밀번호가 잘못되었습니다.");
            window.location.href = "sns.jsp";
        </script>
<%
    }
%>
