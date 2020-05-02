<%-- 
    Document   : pdfg
    Created on : Jun 22, 2019, 11:03:26 AM
    Author     : Dell
--%>

<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
                String order_id=request.getParameter("id");
                String pcode=request.getParameter("pcode");
                String prcode="1_"+pcode;
                String File_name="C:\\Users\\rusmeen khan\\Documents\\NetBeansProjects\\Flipkart\\build\\web\\seller\\products\\"+order_id+".pdf";
                Document doc=new Document();
                try{
                 PdfWriter.getInstance(doc,new FileOutputStream(new File(File_name)));
                 doc.open();
                 PdfPTable table=new PdfPTable(3);
                 PdfPCell cell = new PdfPCell (new Paragraph ("Java4s.com"));
                 cell.setColspan (3);
                 cell.setHorizontalAlignment (Element.ALIGN_CENTER);
                cell.setPadding (10.0f);
                cell.setBackgroundColor (new BaseColor (140, 221, 8));					               
                table.addCell(cell);						               
                table.addCell("Name \n check");
                table.addCell("Address");
                table.addCell("Country");
                table.addCell("Java4s");
                table.addCell("NC");
                table.addCell("United States");
                table.setSpacingBefore(30.0f);       // Space Before table starts, like margin-top in CSS
                table.setSpacingAfter(10.0f);        // Space After table starts, like margin-Bottom in CSS								          

            // Paragraph p=new Paragraph();
             
            // doc.add(Image.getInsta)
             
            // doc.add(Image.getInstance(image))
            String filename = "C:\\Users\\rusmeen khan\\Documents\\NetBeansProjects\\Flipkart\\build\\web\\seller\\products\\"+prcode+".jpg";
            Image image = Image.getInstance(filename);
            image.scaleAbsolute(200f, 200f);
            doc.add(image);
            doc.add(table);
           // doc.add(Image.getInstance("C:\\Users\\Kartik Arya\\Documents\\NetBeansProjects\\generate\\web\\1.JPG"));
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
             Statement st=cn.createStatement();
             ResultSet rs=st.executeQuery("select * from orders where order_id='"+order_id+"'");
             Paragraph p1=null;
             Paragraph p2=null;
             Paragraph p3=null;
             Paragraph p4=null;
             Paragraph p5=null;
             Paragraph p6=null;
             Paragraph p7=null;
             Paragraph p8=null;
             Paragraph p9=null;
             if(rs.next()){
                 p1=new Paragraph();
                 p2=new Paragraph();
                 p3=new Paragraph();
                 p4=new Paragraph();
                 p5=new Paragraph();
                 p6=new Paragraph();
                 p7=new Paragraph();
                 p8=new Paragraph();
                 p9=new Paragraph();
                 pcode=rs.getString("pcode");
                 String pname=rs.getString("pname");
                 String price=rs.getString("price");
                 String seller_code=rs.getString("seller_code");
                 String quantity=rs.getString("quantity");
                 p2.add(rs.getString("pname"));
                 p3.add(rs.getString("quantity"));
                 p4.add(rs.getString("uname"));
                 p5.add(rs.getString("addresstype"));
                 p6.add(rs.getString("landmark"));
                 p7.add(rs.getString("seller_code"));
                 p8.add(rs.getString("size"));
                 p9.add(rs.getString("city"));
                 doc.add(p1);
                 doc.add(p2);
                 doc.add(p3);
                 doc.add(p4);
                 doc.add(p5);
                 doc.add(p6);
                 doc.add(p7);
                 doc.add(p8);
                 doc.add(p9);
                 
             }
             doc.close();
             %>
             <a href="seller\\products\\<%=order_id%>.pdf">View</a>    <%
         }
         catch(Exception e){
             out.println(e.getMessage());
         }
       
        %>
    </body>
</html>
