6<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<body>
<div class="container-fluid" >
        <table class="table table-striped">
            <thead>
                <tr >
                    <td ><h4>Customer _id</h4></td>
                    <td><h4>Buyer_id</h4></td>
                    <td><h4>Seller_id</h4></td>
                    <td><h4>Inv_Ref_No</h4></td>
                    <td><h4>Inv_amount</h4></td>
                    <td><h4>Currency</h4></td>
                </tr>
            </thead>
<%@page import="java.sql.*"%>
            <%
               try {
                	Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
                    Statement statement = connection.createStatement();
                    String sql = "SELECT * FROM SCF_TRANSACTION";
                    ResultSet resultSet = statement.executeQuery(sql);
                    while (resultSet.next()) {
              %>
            <tr>
                <td><%=resultSet.getString("CUSTOMER_ID")%></td>
                <td><%=resultSet.getString("Buyer_id")%></td>
                <td><%=resultSet.getString("Seller_id")%></td>
                <td><%=resultSet.getString("Inv_Ref_No")%></td>
                <td><%=resultSet.getString("Inv_amount")%></td>
                <td><%=resultSet.getString("Currency")%></td>
            </tr>
            <%
                }
                    connection.close();
               } 
            catch (ClassNotFoundException e) {
            	 e.printStackTrace();
            	}
                   catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        </div>
        
</body>
</html>