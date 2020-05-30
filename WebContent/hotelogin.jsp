<html>
<head>
<title>Signup</title>
</head>
<body></body>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
  
         <%@page import ="java.sql.*" %>
         <%@page import ="javax.sql.*" %>
         <%   
              
              
              String name=request.getParameter("name");
         	  String email=request.getParameter("mail");
         	 String phno=request.getParameter("phno");
              String dob=request.getParameter("dob");             
              String password=request.getParameter("pass");
                                     
              try{
              Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection
              ("jdbc:mysql://localhost:3306/hotelmanagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
              String sql="insert into register(name,email,dob,pass,phone)values(?,?,?,?,?)";
              PreparedStatement ps=con.prepareStatement(sql);
                                                  
              ps.setString(1,name);
              ps.setString(2,email);
              ps.setString(3,dob);
              ps.setString(4,password);
              ps.setString(5,phno);
              
              ps.execute();              
         
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Registration Successfull!');");
             out.println("location='home.html';");
             out.println("</script>");
              

              }
              catch(SQLException e)
              {
              out.println("error in loading data");
              out.println(e);
              }
              %>
             
        
              </body>
              </html>