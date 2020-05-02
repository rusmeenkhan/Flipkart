<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<% try{
    String pcode=request.getParameter("pid");
    int sn=Integer.parseInt(request.getParameter("sn"));
String image_code=sn+"_"+pcode;
sn=sn+1;
String contentType = request.getContentType();
System.out.println("Content type is :: " + contentType);
String imageSave=null;
byte dataBytes[]=null;
String saveFile=null;
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
dataBytes = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
saveFile=image_code+".jpg";
// out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1, contentType.length());
// out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
try
{
FileOutputStream fileOut = new FileOutputStream(request.getRealPath("seller/products")+"/"+saveFile);

// fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
imageSave="Success";
try
{
     Class.forName("com.mysql.jdbc.Driver");
     Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root",""); 
     Statement st = cn.createStatement();
     PreparedStatement ps=cn.prepareStatement("insert into images (pcode,image_code) values(?,?)");
     ps.setString(1,pcode);
     ps.setString(2,image_code);
      ps.execute();                      
     if(sn<=3){
     response.sendRedirect("image.jsp?pid="+pcode+"&sn="+sn+"");
     }
     else{
         st.execute("update product set status=1 where product_code='"+pcode+"'");
         response.sendRedirect("index.jsp?success=1");
     }
     cn.close(); 
}
catch(Exception e)
{
    out.println(e.getMessage());
}
//response.sendRedirect("index.jsp?product_uploaded_successfully");
}catch (Exception e)
{
System.err.println ("Error writing to file");
imageSave="Failure";
}
}
%>
<html>
<HEAD>
<META http-equiv="Content
      -Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>File Upload Success/Failure</TITLE>
<STYLE>
table {
border:1px solid #000;
border-collapse:collapse;
font-family:arial,sans-serif;
font-size:80%;
}
td,th{
border:1px solid #000;
border-collapse:collapse;
} 
tbody td{
background:#999; 
} 
tbody th{
text-align:left;
background:#69c;
}
tfoot td{
text-align:center;
font-weight:bold;
background:#FFFFFF;
}
</STYLE>
</HEAD>
<body>
<table align="center" width="300" height="100">
<tbody>
<tr>
<th width="85">Image Name:</th>
<td width="60"><%=saveFile%></td>
</tr>
<tr>
<th width="85">No Of Bytes:</th>
<td width="60"><%=dataBytes.length%></td>
</tr>
<tr>
<th width="85">Image Save:</th>
<td width="60"><%=imageSave%></td>
</tr>
</tbody>
<tfoot>
<tr>
<td colspan="2">
<a style="color:#FF0000;" href="index.jsp" title="File Upload">File Upload</a>
  
<a style="color:#FF0000;" href="javascript:window.close();" title="Close Upload Window">
Close Window
</a>
</td>
</tr>
</tfoot>
</table>

<%
   String img=saveFile;
   out.println("<img src='"+img+"' width=300 height=200 title='"+img+"'>");
  
  }catch(Exception e){
out.println(e.getMessage());
  }%>
</body>
</html>
