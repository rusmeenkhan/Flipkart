
<%@page import="java.sql.*,java.util.*"%>
<%
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
            if(request.getParameter("Name")==null||request.getParameter("Email")==null||request.getParameter("pass")==null||request.getParameter("repass")==null||request.getParameter("address")==null||request.getParameter("cname")==null||request.getParameter("GST")==null){
                        response.sendRedirect("login.jsp?all field required");
            }
            else{ 
                if(request.getParameter("pass").equals(request.getParameter("repass")))
                {
                        String email=null;
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from seller");
                        while(rs.next()){
                            email=rs.getString("Email");
                        }
                        if(request.getParameter("Email").equals(email)){
                           response.sendRedirect("index.jsp?email_already_exist") ;
                        }
                        String scode="";
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
                           scode+=l.get(i);
                        }
                        String Name=request.getParameter("Name");
                        String Email=request.getParameter("Email");
                        String pass=request.getParameter("pass");
                        String address=request.getParameter("address");
                        String cname=request.getParameter("cname");
                        String GST=request.getParameter("GST");
                        PreparedStatement ps=cn.prepareStatement("insert into seller (sname,Email,pass,Address,Company,GST,scode) values(?,?,?,?,?,?,?)");
                        ps.setString(1,Name);
                        ps.setString(2,Email);
                        ps.setString(3,pass);
                        ps.setString(4,address);
                        ps.setString(5,cname);
                        ps.setString(6,GST);
                        ps.setString(7,scode);
                        ps.execute();
                        cn.close();
                        response.sendRedirect("index.jsp?success=1");
                }
                else
                {
                    response.sendRedirect("index.jsp?passwordshouldbesame");
                }
            }
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
    %>