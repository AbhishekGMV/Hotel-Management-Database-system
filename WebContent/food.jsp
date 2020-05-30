<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FACILITIES</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<style>

   body{
        background-image: url(food.jpg);
        background-repeat: no-repeat center fixed;
        background-size: 100%;
      }

      form {
  margin:0 auto;
  width:300px
  }
  input {
  margin-bottom:3px;
  padding:10px;
  width: 100%;
  border:1px solid #CCC
  }
  button {
  padding:10px
  }
  label {
  cursor:pointer
  }

.content-table {
  border-collapse: collapse;
  margin: 25px 0;
  font-size: 0.9em;
  min-width: 400px;
  border-radius: 5px 5px 0 0;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
  background-color: #009879;
  color: #ffffff;
  text-align: left;
  font-weight: bold;
}

.content-table {
    margin: 0 auto;
}

.content-table td {
    text-align: center;
}

.content-table th,
.content-table td {
  padding: 12px 15px;
}

.content-table tbody tr {
  border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even) {
  background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
  border-bottom: 2px solid #009879;
}

.content-table tbody tr.active-row {
  font-weight: bold;
  color: #009879;
}


</style>

<body>


<div class="container">
        <nav class="navbar navbar-default navbar-inverse navbar-fixed-top">

        <div class="navbar-header">

          <a href="home.html" class="navbar-brand">Hotel Management</a>

        </div>
        <ul class="nav navbar-nav">
          <li><a href="food.jsp">Food</a></li>
          <li> <a href="facilities.jsp">Facilities</a> </li>
          <li><a href="rating.html">Rate us</a></li>
          

        </ul>
        </nav>
            </div>
<table class="content-table" style="text-align:center;" >
 
            
      <br><br><br>
<center><b><h1>FOOD</h1></b></center>
<thead>
<tr><th>NAME</th>
	<th>TYPE</th>
	<th>PRICE</th>
	</tr>
</thead>
<%
 try
{
	 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
     java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HotelManagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false", "root", "");
     String Query="select * from food"; 
     PreparedStatement psm=conn.prepareStatement(Query);
     ResultSet rs=psm.executeQuery();
     while(rs.next())
     {
    	 
    	 %>
	 <tr>
	 <td><%=rs.getString("food_name") %></td>
	 <td><%=rs.getString("food_type") %></td>
	 <td><%=rs.getInt("price") %></td>
	 </tr><%
	 }
}
catch(Exception ex)
{
	out.println("ex");
}
%>
	
     
      

</font>
</table>

</body>
</html>