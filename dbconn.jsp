<%@ page import="java.sql.*"%>
<%	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/mysnsdb";
	String user = "root";
	String password = "010221";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
%>
