<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP '1.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<%String read_session=(String)session.getAttribute("read_session");
	%><FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
<FRAME name=header src="jdbcuser/header1.html" frameBorder=0  scrolling="auto">
<FRAME name=right src="jdbcuser/weidlu.jsp" frameBorder=0 >
<FRAMESET cols="170, *">
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
<a href='jdbcuser/login.html' target='_top'>你还没有正确登录</a> <br><%
	out.print("<a href='jdbcuser/login.html' target='_top'>你还没有登录</a>");
	%>

	
</html>
