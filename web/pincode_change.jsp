<%@page import="java.sql.*"%>
<%
            try{
                   String scode=request.getParameter("scode");
                   String pcode=request.getParameter("pcode");
            %>
                        <div class="my-sm-4 my-3" id="pc">
                                <h2>  Verify Pin code</h2> <input type="text" name="pincode" id="pin" rel="<%=scode%>"   class="form-control">
                                <center>  <button  id="<%=pcode%>" class="btn btn-default" rel="verify" style="margin-top: 30px"> Verify </button> </center>
                        </div>
                        <div class="my-sm-4 my-3" id="available">

                        </div>            
            <%
            }          
            catch(Exception e){
                out.println(e.getMessage());
            }                   
             %>
  
