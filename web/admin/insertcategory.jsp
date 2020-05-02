
<%@page import="java.sql.*,java.util.*"%>
<%
    if(request.getParameter("cname")==null){
                response.sendRedirect("index.jsp?all field required");
    }
    else{ 
        
        try{   
           String ccode="";
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
              ccode+=l.get(i);
              
           }
                    String cname=request.getParameter("cname"); 
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            PreparedStatement ps=cn.prepareStatement("insert into Category (cname,ccode) values(?,?)");
                                    ps.setString(1,cname);
                                    ps.setString(2,ccode);
                                    ps.execute();
                                    cn.close();
                                    response.sendRedirect("index.jsp?success=1");
                }
                catch(Exception e)
                {
                    out.println(e.getMessage());
                }
             }
    %>