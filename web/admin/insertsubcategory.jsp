
<%@page import="java.sql.*,java.util.*"%>
<%
    if(request.getParameter("subcname")==null||request.getParameter("category")==null){
                response.sendRedirect("index.jsp?all field required");
    }
    else{ 
        
        try{   
            //String category=request.getParameter("category");
            String subcategory=request.getParameter("subcname");
           String subccode="";
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
              subccode+=l.get(i);
              
           }
            
                     String cname=null;
                     String ccode=request.getParameter("category"); 
                     //out.println(cname);
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                     Statement st=cn1.createStatement();  
                    ResultSet rs1=st.executeQuery("select * from Category where ccode='"+ccode+"'");
                        while(rs1.next())
                          { 
                            cname =rs1.getString("cname");       
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/FLIPKART","root","");
                            PreparedStatement ps=cn.prepareStatement("insert into subcategory (subcategory,subccode,Category,ccode) values(?,?,?,?)");
                            ps.setString(1,subcategory);
                            ps.setString(2,subccode);
                            ps.setString(3,cname);
                            ps.setString(4,ccode);
                            ps.execute();
                            cn.close();
                            response.sendRedirect("index.jsp?success=1");
                }
        }
                catch(Exception e)
                {
                    out.println(e.getMessage());
                }
             }
    
    %>