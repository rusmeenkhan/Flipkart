<%@page import="java.sql.*" %>

<%                            
    try
    {
        String scode=request.getParameter("id");
        String pass=request.getParameter("cp");
        String np=request.getParameter("np");
        String rp=request.getParameter("rp");
        if(np.equals(rp))
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Flipkart","root","");
            Statement st = cn.createStatement();
            ResultSet rs=st.executeQuery("select * from seller where scode='"+scode+"'");
            if(rs.next())
             {
                if(rs.getString("pass").equals(pass))
                {
                  st.execute("update seller set pass='"+np+"' where scode='"+scode+"'");
                  response.sendRedirect("index.jsp?passwordchanged");
                  out.println("Password changed Successfully");
                }
                else
                {
                  response.sendRedirect("ChangePassword.jsp?current_password_not_match");
                 }
             }
            else
            {
              response.sendRedirect("index.jsp?email invaid");  
            }
            cn.close();
        }
        else
        {
           response.sendRedirect("ChangePassword.jsp? password  mismatch"); 
        }
    }   
    catch(Exception e)
    {
      out.println(e.getMessage());  
    }
                                    
%>
