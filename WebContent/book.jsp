<html>
<head>
<title>Booking</title>
</head>
<body></body>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BOOKING PAGE</title>

         <%@page import ="java.sql.*" %>
         <%@page import ="javax.sql.*" %>
         <%

			  String roomno = null;
              String place=request.getParameter("place");
              String rtype=request.getParameter("rtype");
        	  String cin=request.getParameter("in");
              String cout=request.getParameter("out");
              String uid = request.getParameter("uid"); 
              
              
              String fac = request.getParameter("fac"); 
              String food = request.getParameter("food"); 

              
              
              int rcost=0;
              if(rtype.equals("Single"))
            	  rcost = 1000;
              else if(rtype.equals("Twin"))
            	  rcost = 2000;
              else if(rtype.equals("Master suite"))
              	  rcost = 3000;
              else if(rtype.equals("King"))	  
				  rcost = 4000;
              
              int total = rcost;
              int total1 = 0;
              
              if(fac.equals("Yes")){
                  total1+=1000;
              }
              
              if(food.equals("Yes")){
            	  total1+=1000;
              }
                    int billtotal = total+total1;
                    
              String roomcost = Integer.toString(rcost);
              String etotal = Integer.toString(total1);
              String atotal = Integer.toString(billtotal);
              
              try{
              Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection
              ("jdbc:mysql://localhost:3306/hotelmanagement?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
             
             String query = "insert into payment(user_id,check_in,check_out,room_cost,extras,bill_total) values(?,?,?,?,?,?)";
             PreparedStatement preparestatement=con.prepareStatement("{call booking(?,?,?,?,?,?,?)}");
             PreparedStatement ps = con.prepareStatement(query);
              ps.setString(1,uid);
             ps.setString(2,cin);
             ps.setString(3,cout);
             ps.setString(4,roomcost);
             ps.setString(5,etotal);
             ps.setString(6,atotal);
      	   ps.execute(); 
              preparestatement.setString(1,rtype); 
              preparestatement.setString(2,cin);
              preparestatement.setString(3,cout);
              preparestatement.setString(4,place);
              preparestatement.setString(5,roomcost);
              preparestatement.setString(6,roomno);
              preparestatement.setString(7,uid);             
              preparestatement.execute();
		
                    
               out.println("<script type=\"text/javascript\">");
              out.println("alert(\"Booking successfull! \")");
              out.println("window.location = \"summary.html\";");
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
