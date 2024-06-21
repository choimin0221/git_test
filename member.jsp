<%@ include file="dbconn.jsp" %>
<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String passwordcheck = request.getParameter("passwordcheck");
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        String sql = "INSERT INTO member (id, password, passwordcheck, name, birth, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)"; 
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(0, id);
        pstmt.setString(1, password);
        pstmt.setString(2, passwordcheck);
        pstmt.setString(3, name);
        pstmt.setString(4, birth);
        pstmt.setString(5, email);
        pstmt.setString(6, phone);
        pstmt.executeUpdate();

        response.sendRedirect("sns.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
