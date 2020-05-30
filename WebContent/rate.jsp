<html>
<head>
<title>Rating</title>
</head>
<body></body>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  
         <%@page import ="java.sql.*" %>
         <%@page import ="javax.sql.*" %>
         <%   
              
              
              String uid=request.getParameter("uid");
         	  String rate=request.getParameter("rate");
         	 String rev=request.getParameter("rev");
        
                                     
              try{
              Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection
              ("jdbc:mysql://localhost:3306/hotelmanagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
              String sql="insert into rating(user_id,rate,review)values(?,?,?)";
          
              
              PreparedStatement ps=con.prepareStatement(sql);
                           
              
              ps.setString(1,uid);
              ps.setString(2,rate);
              ps.setString(3,rev);
            
              ps.execute();
              
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Thanks for rating us!');");
              out.println("location='home.html';");
              out.println("</script>");
              

              }
              catch(SQLException e)
              {
              out.println("Something went wrong! Try again");
              out.println(e);
              }
              %>
              </body>
              </html>