<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>newuser</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.js">
    <link rel="stylesheet" href="newser.css">
</head>
<body >
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Name = (String)session.getAttribute("Name");
String userID=null;
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
  <!--new user register page-->
<div class="new">
        <form class="ui form" method="post" action="successupdate.jsp?Name=<%=Name%>">
        <br><br>
        <h1>User | Update profile</h1><br>
                <h3 class="ui dividing header">Fill in  Information</h3>
                <div class="field">
                  <div class="two fields">
                    <div class="field">
                    <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM patients_info where name='"+Name+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                    
                  <label>Name</label>
                      <input type="text" name="name" placeholder="Enter your name" value="<%=resultSet.getString("name") %>">
                    </div>
                    <div class="field">
                    
                  <label>Password</label>
                      <input type="text" name="pwd" placeholder="Enter a password" value="<%=resultSet.getString("password") %>">
                    </div>
                   
                  </div>
                </div>
                <div class="two fields">
                  <div class="field">
                    <label>Contact number</label>
                    <input type="number" name="pno" placeholder="phone number" value="<%=resultSet.getString("contact_no") %>">
                    
                  </div>
                  <div class="field">
                    <label for="">Email id</label>
                    <input type="text" name="pemail" placeholder="email id" value="<%=resultSet.getString("email") %>">
                  </div>
                </div>
                <div class= "three fields">
                    <div class="field">
                  <label>Patient Address</label>
                    <input type="text" name="street" placeholder="Street Address" value="<%=resultSet.getString("street") %>">
                    </div>
                    <div class=" field">
                      <label for="">locality/Area</label>
                      <input type="text" name="area" placeholder="Area" value="<%=resultSet.getString("locality") %>">
                    </div>
                    <div class="field">
                      <label for="">Adhaar number</label>
                      <input type="number" name="aadhar" placeholder="adhaar number" value="<%=resultSet.getString("aadhar") %>">
                    </div>
                 
                </div>
                <div class="two fields">
                  <div class="field">
                    <label>State</label>
                    <select class="ui fluid dropdown" name="state">
                      <option value="<%=resultSet.getString("state") %>" >State</option>
                  <option value="AP">Andhra Pradesh</option>
	<option value="AR">Arunachal Pradesh</option>
	<option value="AS">Assam</option>
	<option value="BR">Bihar</option>
	<option value="CT">Chhattisgarh</option>
	<option value="GA">Gujarat</option>
	<option value="HR">Haryana</option>
	<option value="HP">Himachal Pradesh</option>
	<option value="JK">Jammu and Kashmir</option>
	<option value="GA">Goa</option>
	<option value="JH">Jharkhand</option>
	<option value="KA">Karnataka</option>
	<option value="KL">Kerala</option>
	<option value="MP">Madhya Pradesh</option>
	<option value="MH">Maharashtra</option>
        <option value="MN">Manipur</option>
        <option value="ML">Meghalaya</option>
	<option value="MZ">Mizoram</option>
	<option value="NL">Nagaland</option>
	<option value="OR">Odisha</option>
	<option value="PB">Punjab</option>
	<option value="RJ">Rajasthan</option>
	<option value="SK">Sikkim</option>
	<option value="TN">Tamil Nadu</option>
	<option value="TG">Telangana</option>
	<option value="TR">Tripura</option>
	<option value="UT">Uttarakhand</option>
	<option value="UP">Uttar Pradesh</option>
	<option value="WB">West Bengal</option>
	<option value="AN">Andaman and Nicobar Islands</option>
	<option value="CH">Chandigarh</option>
	<option value="DN">Dadra and Nagar Haveli</option>
	<option value="DD">Daman and Diu</option>
	<option value="DL">Delhi</option>
	<option value="LD">Lakshadweep</option>
	<option value="PY">Puducherry</option>
                 
                    </select>
                  </div>
                  <div class="field">
                    <label>Country</label>
                   <div class="field">
                    
                    <select class="ui fluid dropdown" name="country">
                      <option value="<%=resultSet.getString("country") %>">Country</option>
                  <option value="India">India</option>
                  <option value="Bangladesh">Bangaldesh</option>
                  <option value="Pakistan">Pakistan</option>
                  <option value="Srilanka">Srilanka</option>
                    </select>
                  </div>
                     </div>
                  </div>
                  <%
}

} catch (Exception e){
e.printStackTrace();
}
%>
               <center><a href="successupdate.jsp">
                   <button  class="ui green button">Submit ></button></a>
                  
                   </center>
                    
       
              </form>
            </div>  
</body>
</html>