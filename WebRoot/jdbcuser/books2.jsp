<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  <style type="text/css">    
 body{    
      background-image: url(jdbc/book_image/p11.png);    
      background-repeat: repeat-x;    
 }    
 </style> 
  <body>
  <a   href="jdbcuser/books.jsp" target=left>返回</a> <br/>
  <%@include file="conn.jsp"  %>
    <% 
    String s =new String(request.getParameter("readerID").getBytes("iso-8859-1"), "utf-8");
   String a ="";
   if(s!=null){
  a=s;}		
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String query ="select * from book where SORT = '"+a+"' order by BookId asc";
 try{
 ResultSet rs = stmt.executeQuery(query);
 %>
		      <table border=1 align=center>
		      <caption>图书列表</caption>
		      <tr>		 
		       <th><%out.print("封面");%></th>		           
		      	<th><%out.print("书号");%></th>
		        <th><%out.print("书名");%></th>
		        <th><%out.print("作者");%></th>
		        <th><%out.print("出版社");%></th>
		        <th><%out.print("出版日期");%></th>
		        <th><%out.print("价格");%></th>	
		         <th><%out.print("库存");%></th>	
		          <th><%out.print("内容分类代码");%></th>	
		         <th><%out.print("是否借阅");%></th>	          
		        </tr>
		      <% String a1="";
		      while(rs.next()) { if( a1.equals(rs.getString("BookId"))){a1=rs.getString("BookId");}   else{%>
		      <tr>
		       <td><a href="jdbcuser/book_detail.jsp?bookId=<%=rs.getString("BookID") %>"><img src="<%= rs.getString("image")%>"/></a></td>
		    
		           <td><a href="jdbcuser/book_detail.jsp?bookId=<%=rs.getString("BookID") %>"><%=rs.getString("BookID") %></a></td>
		  
		      	<td><%out.print(rs.getString("BookName"));%></td>
		        <td><%out.print(rs.getString("Author"));%></td>
		        <td><%out.print(rs.getString("Press") );%></td>
		        <td><%out.print(rs.getDate("PressDate"));%></td>
		         <td><%out.print(rs.getFloat("Price"));%></td>
		          <td><%out.print(rs.getInt("BookNUM"));%></td>
		           <td><%out.print(rs.getInt("SORT"));%></td>
		            <%if(rs.getInt("BookNUM")!=0) {%><td><input type="button" value="借阅预约" onclick="location.href='jdbcuser/book_borrow2.jsp?bookId=<%=rs.getString("BookID")%>'"></input></td>
		       </tr>
		   <%}else{%><td>零库存</td><%}%>
		      <%a1=rs.getString("BookId");}}%>
		      </table>
		      
		      
		      
		      
		      
		        <!--  
		         -->
		      <%}catch(SQLException e){
		      out.print(e.getMessage());
		      }finally{
		      con.close();}%>
		      
		    
  </body>
</html>
