<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" pageEncoding="utf-8"%>

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
	<link rel="stylesheet" href="jdbcuser/css/bootstrap.css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
.STYLE1 table tr td p strong {
	color: #000;
	font-size: 24px;
	font-weight: bold;
}
.STYLE1 table tr td p {
	font-size: 18px;
}
.STYLE1 table tr td p strong {
	font-size: 24px;
}
-->
</style>

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>

  </head>
  
  <body>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="jdbcuser/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="jdbcuser/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="jdbcuser/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：高级管理-&gt;预约信息</td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="4" class="STYLE1"><table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">

</table>
		<%@include file="conn.jsp"%>
		<%	PreparedStatement pstmt;			
		String sql1 = "select * from borrow2,book where borrow2.BkID=book.BkID order by ReaderID";
			pstmt = con.prepareStatement(sql1);
				ResultSet rs1= pstmt.executeQuery();
				if(rs1.next()){}
				else{
				out.print("暂无记录");
				}
			String sql = "select * from borrow2,book where borrow2.BkID=book.BkID order by ReaderID";
			
			try {
			pstmt = con.prepareStatement(sql);
				ResultSet rs= pstmt.executeQuery();
			String oldReader=null;
		      while(rs.next()) {    
		      String newReader=rs.getString("borrow2.ReaderID");
		      if (!newReader.equals(oldReader)){
		      System.out.println(oldReader);
			%>
		     
		        <table align=center width="100%">
		      <center><font size="5" font-family="微软雅黑">读者<%=newReader %>所预约的图书列表</font></center>
		      </table>
		       <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" class="table table-hover">
      <tr>
        <td width="15%" height="20" bgcolor="#f5f5f5"><div align="center">书名</div></td>
        <td width="5%" height="20" bgcolor="#f5f5f5"><div align="center">库存号</div></td>
        <td width="10%" height="20" bgcolor="#f5f5f5"><div align="center">作者</div></td>
        <td width="15%" height="20" bgcolor="#f5f5f5"><div align="center">出版社</div></td>
        <td width="10%" height="20" bgcolor="#f5f5f5"><div align="center">出版日期</div></td>
        <td width="5%" height="20" bgcolor="#f5f5f5"><div align="center">价格</div></td>
        <td width="10%" height="20" bgcolor="#f5f5f5"><div align="center">预约时间</div></td>
        <td width="10%" height="20" bgcolor="#f5f5f5"><div align="center">预约到期时间</div></td>
        <td width="5%" height="20" bgcolor="#f5f5f5"><div align="center">借阅</div></td>
      </tr>
		      <tr>
		    	  <td height="20"><div align="center"><%=rs.getString("book.BookName") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("book.BkId")%></div></td>
        <td height="20"><div align="center"><%=rs.getString("book.Author") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("book.Press") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("book.PressDate") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("book.Price") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("borrow2.BorrowDate") %></div></td>
        <td height="20"><div align="center"><%=rs.getString("borrow2.ReturnDate") %></div></td>
        <td height="20"><div align="center"><input type="button" value="借阅" onclick="location.href='jdbcuser/book_borrow3.jsp?BkId=<%=rs.getString("BkID")%>&bookId=<%=rs.getString("BookID")%>&ReaderID=<%=newReader%> '"></input></div></td>
          
      </tr>
       <%
		  
		      
		      oldReader=newReader;
		      }else{
		      System.out.println(oldReader);%>
		       <tr>
	           <td height="20"><div align="center"><%out.print(rs.getString("book.BookName"));%></div></td>
	           <td height="20"><div align="center"><%out.print(rs.getString("book.BkId"));%></div></td>
		        <td height="20"><div align="center"><%out.print(rs.getString("book.Author"));%></div></td>
		        <td height="20"><div align="center"><%out.print(rs.getString("book.Press") );%></div></td>
		        <td height="20"><div align="center"><%out.print(rs.getDate("book.PressDate"));%></div></td>
		         <td height="20"><div align="center"><%out.print(rs.getFloat("book.Price"));%></div></td>
		          <td height="20"><div align="center"><%out.print(rs.getDate("borrow2.BorrowDate"));%></div></td>
		           <td height="20"><div align="center"><%out.print(rs.getDate("borrow2.ReturnDate"));%></div></td>
		               <td height="20"><div align="center"><input type="button" value="借阅" onclick="location.href='book_borrow3.jsp?BkId=<%=rs.getString("BkID")%>&bookId=<%=rs.getString("BookID")%>&ReaderID=<%=newReader%> '"></input></td>
		     
		        </tr>
		     <%  oldReader=newReader;
		      }}
		     %>
		      </table>
		       
	      <%}catch(SQLException e){
		      out.print(e.getMessage());
		      }finally{
		      con.close();}%>

	</body>
</html>
