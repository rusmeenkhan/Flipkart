    <%@page import="java.sql.*"%>
    <%
        try{
                    String ucode=null;
                    String uscode=null;
                    String email=null;
                    Cookie c[]=request.getCookies();
                    for(int i=0;i<c.length;i++)
                    {
                      if(c[i].getName().equals("user"))
                      {
                          email=c[i].getValue();
                          break;
                      }
                    }
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/flipkart","root","");
                    Statement st=cn.createStatement();
                    if(email!=null&&session.getAttribute(email)!=null)
                      {
                          ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
                          if(rs.next()){
                              ucode=rs.getString("ucode");
                          }
                      }
                    else{
                        for(int i=0;i<c.length;i++){
                            if(c[i].getName().equals("nuser"))
                            {
                                uscode=c[i].getValue();
                                break;
                            }
                        }
                    }
                    if(ucode==null){
                        ucode=uscode;
                    }
                   
                   String pincode=request.getParameter("id");
                   String scode=request.getParameter("scode");
                   String pcode=request.getParameter("pcode");
                   ResultSet rs=st.executeQuery("select * from Location where scode='"+scode+"' AND pincode='"+pincode+"'");
                   if(rs.next()){
                                ResultSet rs1=st.executeQuery("select pcode from temp where ucode='"+ucode+"' AND pcode='"+pcode+"'");
                                if(rs1.next()){
    %>
                           <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                              <button id="p_<%=pcode%>" rel="Remove" ucode="<%=ucode%>" class="btn btn-primary" style="background-color:red">Remove From cart </button>	
                           </div> 
                           <%
                           }
                            else{
                           %>
                            <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                              <button id="p_<%=pcode%>" rel="Remove" ucode="<%=ucode%>" class="btn btn-primary">Add to cart </button>	
                           </div> 
                           
                    <%
                            }
                    }
                    else{
                        %>
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                              <button class="btn btn-dark" style="background-color:red">Not Available</button>	
                        </div>
                    <%
                   }
                    %>
                    <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                        <button pcode="<%=pcode%>"  rel="change" class="btn btn-default" id="<%=scode%>" style="background-color:greenyellow">Change pincode </button>	
                    </div>
            <%
                   cn.close();
               }
               catch(Exception e)
               {
                   out.println(e.getMessage());
               }
                                
             %>
  
