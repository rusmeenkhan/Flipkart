
<%@page import="java.sql.*,java.util.*"%>
<%
            String category=request.getParameter("id");
            //out.println(category);
            Class.forName("com.mysql.jdbc.Driver");
            String subccode=null;
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn1.createStatement();  
            ResultSet rs=st.executeQuery("select * from Subcategory where ccode='"+category+"'");
            %>
            <select>
<%
            while(rs.next())
                  {
                       subccode=rs.getString("Subcategory");
                      //out.println(subccode);
                      %>
                      <option value="<%=rs.getString("subccode")%>"><%=subccode%> </option>
                      <%
                    }%>
            </select>
            <select>
<%
            ResultSet rs1=st.executeQuery("select * from size where subcategory='"+subccode+"'");
            while(rs1.next())
                  {
                      String size=rs.getString("size");
                      //out.println(subccode);
                      %>
                      <option value="<%=rs1.getString("size")%>"><%=size%> </option>
                      <%
                    }%>
            </select>
            <%
                     cn1.close();
                     //response.sendRedirect("checkout.jsp");
    %>