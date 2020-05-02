
<%@page import="java.sql.*,java.util.*"%>
<%
            String subcategory=request.getParameter("id");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            Statement st=cn1.createStatement();  
            ResultSet rs=st.executeQuery("select * from size where Subcategory='"+subcategory+"'");
            %>
            <select>
<%
            while(rs.next())
                  {
                      String size=rs.getString("size");
                      %>
                      <option value="<%=rs.getString("size")%>"><%=size%> </option>
                      <%
                    }%>
            </select>
    <%
            cn1.close();
    %>