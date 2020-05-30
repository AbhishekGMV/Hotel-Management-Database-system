<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN PAGE</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
        <%
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelmanagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false", "root", "");
            String Query="select * from login where name=? and pass=?";
            //String query ="select user_id from register where name=?";
            PreparedStatement psm=conn.prepareStatement(Query);
            /*PreparedStatement psm1=conn.prepareStatement(query);*/
            psm.setString(1,name);
            psm.setString(2,pass);
            
            //psm1.setString(1,name);
            
            ResultSet rs=psm.executeQuery();
            /*ResultSet rs1=psm1.executeQuery();
            if(rs1.next())
            {
			out.println("Your ID: "+rs1.getInt(1));
            }
           else
            {
            out.println("NAHH MATE! DIDN'T WORK");	
            }*/
           
            if(rs.next())
            {
            response.sendRedirect("book.html");
            }                  
                else
              { 
                	out.println("<script type=\"text/javascript\">");
                    out.println("alert(\"Invalid Login Details! \")");
                    out.println("window.location = \"home.html\";");
                    out.println("</script>");
                	
                  
              }
            
            }
            catch(Exception e)
              {
              out.println(e);
              }
%>

</body>
</html>