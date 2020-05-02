
<%@page import="java.sql.*,java.util.*"%>
<%
   try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
        if(request.getParameter("Name")==null||request.getParameter("Email")==null||request.getParameter("pass")==null||request.getParameter("repass")==null){
                    response.sendRedirect("login.jsp?all field required");
        }
        else{ 
            if(request.getParameter("pass").equals(request.getParameter("repass")))
            {
                String email=null;
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select * from user");
                while(rs.next()){
                    email=rs.getString("email");
                }
                if(request.getParameter("Email").equals(email)){
                   response.sendRedirect("index.jsp?email_already_exist") ;
                }
                else{  
                        String ucode="";
                        LinkedList l=new LinkedList();
                        for(char c='a';c<='z';c++)
                        {
                            l.add(c+"");
                        }
                         for(char c='A';c<='Z';c++)
                        {
                            l.add(c+"");
                        }
                          for(char c='0';c<='9';c++)
                        {
                            l.add(c+"");
                        }
                        Collections.shuffle(l);
                         for(int i=1;i<=5;i++)
                        {
                           ucode+=l.get(i);

                        }
                        String Name=request.getParameter("Name");
                        String Email=request.getParameter("Email");
                        String pass=request.getParameter("pass");
                        String Mobile=request.getParameter("mob");
                        String Address=request.getParameter("Address");
                        PreparedStatement ps=cn.prepareStatement("insert into user (Name,Email,pass,ucode,mobile,address) values(?,?,?,?,?,?)");
                        ps.setString(1,Name);
                        ps.setString(2,Email);
                        ps.setString(3,pass);
                        ps.setString(4,ucode);
                        ps.setString(5,Mobile);
                        ps.setString(6,Address);
                        ps.execute();
                        cn.close();
                        Cookie co=new Cookie("user",Email);
                        co.setMaxAge(6000);
                        response.addCookie(co);
                        session.setAttribute(Email,pass);
                        session.setMaxInactiveInterval(1000);
                        response.sendRedirect("index.jsp?success=1");
                }
            }
            else
            {
                response.sendRedirect("index.jsp?passwordshouldbesame");
            }
        }
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    %>