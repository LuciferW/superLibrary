<%@ page language="java" import="java.util.*,fd.RFIDapi,fd.t" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'read.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><%
   RFIDapi pi =new RFIDapi();
   pi.testinitreader();
   pi.testreadandwrite3();
   byte[] datar = new byte[12];
   // datar =pi.testreadandwrite3();
   //out.print(" tags:" ++"<br>");
   for(int i=0;i<  pi.testreadandwrite3().length;i++){
  // datar[i] =pi.testreadandwrite3()[i];
  out.print(" ");
   out.print(pi.testreadandwrite3()[i]& 0xff);}
   
 /*  byte s =9;
   
   s+=16;//确保两位
   
   //pi.testreadandwrite3()[0]=s;
   byte[] data=new byte[]{pi.testreadandwrite3()[0],0x24,0x36,0x46,0x56,0x66,0x76,(byte)0x86,(byte)
		 0x96,(byte) 0xaa,(byte) 0xbb,(byte) 0xcc};
		 //out.print(data.length+"<br>");
   pi.testreadandwrite1(data);
   out.print(" tagssssssss:" +pi.testreadandwrite1(data)+"<br>");*/
   pi.closeReader();
      
   
   
   %>
  </body>
</html>
