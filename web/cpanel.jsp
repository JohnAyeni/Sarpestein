<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" import="java.sql.*" errorPage=""%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.swing.*"%>
<%@page import = "java.util.Date"%>
<%
    session = request.getSession(false);
    String admin = (String) session.getAttribute("admin_id");
    if (admin == null){
        session.setAttribute("msg", "You Have to log in");
        response.sendRedirect("admin-login-form.jsp");
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- main stylesheet -->
    <title>Sarpestein | Home</title>
</head>
<%--<div id="mySidenav" class="sidenav">--%>
    <%--<a href="index.jsp" id="logout-side-nav">Logout</a>--%>
<%--</div>--%>

<!-- check out button -->
<a href="logout.jsp" class="btn btn-default btn-lg btn-danger" style="border-radius: 0px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);z-index: 2;position: fixed;top: 15%;">LOG OUT</a>

<div class="container">
    <a href="index.jsp"><h3>Admin Panel</h3></a>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Users</a></li>
        <li><a data-toggle="tab" href="#menu2">Devices</a></li>
        <li><a data-toggle="tab" href="#menu3">Orders</a></li>
        <li><a data-toggle="tab" href="#menu4">Add Catalogue File</a></li>
    </ul>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <h3>Users</h3>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Sex</th>
                        <th>Date Registered</th>
                    </tr>
                    </thead>
                    <tbody>
<%
try{
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", "");
    Statement st = (Statement) con.createStatement();
    String select = "SELECT * FROM users";
    ResultSet rs = st.executeQuery(select);
    while(rs.next())
    {
        String id = rs.getString("id");
        String fname = rs.getString("firstname");
        String lname = rs.getString("lastname");
        String email = rs.getString("email");
        String sex = rs.getString("sex");
        out.write("<tr>");
        out.write("<td>"+ id +"</td>");
        out.write("<td>"+ fname +"</td>");
        out.write("<td>"+ lname +"</td>");
        out.write("<td>"+ email +"</td>");
        out.write("<td>"+ sex +"</td>");
        Date date = new Date();
        date = rs.getDate("reg_date");
        out.write("<td>"+ date +"</td>");
        out.write("</tr>");
        }
    con.close();
    }
    catch(Exception ex){
    out.write("Error 404");
    }
%>
                   </tbody>
                </table>
            </div>
        </div>
            <div id="menu2" class="tab-pane fade">
        <h3>Devices</h3>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>id</th>
                    <th>Device Type</th>
                    <th>Brand</th>
                    <th>RAM</th>
                    <th>Storage</th>
                    <th>Screen Size</th>
                    <th>Cost</th>
                    <th>Suplier</th>
                    <th>Date Registered</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try{
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/device_store_db", "root", "");
                        Statement st = (Statement) con.createStatement();
                        String select = "SELECT * FROM catalogue";
                        ResultSet rs = st.executeQuery(select);
                        while(rs.next())
                        {
                            String id = rs.getString("id");
                            String type = rs.getString("device_type");
                            String brand = rs.getString("brand_name");
                            String ram = rs.getString("ram");
                            String storage = rs.getString("storage_size");
                            String size = rs.getString("screen_size");
                            String cost = rs.getString("cost");
                            String supplier = rs.getString("supplier");
                            out.write("<tr>");
                            out.write("<td>"+ id +"</td>");
                            out.write("<td>"+ type +"</td>");
                            out.write("<td>"+ brand +"</td>");
                            out.write("<td>"+ ram +"</td>");
                            out.write("<td>"+ storage +"</td>");
                            out.write("<td>"+ size +"</td>");
                            out.write("<td>"+ cost +"</td>");
                            out.write("<td>"+ supplier +"</td>");
                            Date date = new Date();
                            date = rs.getDate("reg_date");
                            out.write("<td>"+ date +"</td>");
                            out.write("</tr>");
                        }
                        con.close();

                    }
                    catch(Exception ex){
                        out.write("Error 404");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
        <div id="menu3" class="tab-pane fade">
            <h3>Orders</h3>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>user_id</th>
                        <th>User Name</th>
                        <th>item_id</th>
                        <th>Delivery Address</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try{
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/burger", "root", "");
                            Statement st = (Statement) con.createStatement();
                            String select = "SELECT * FROM orders";
                            ResultSet rs = st.executeQuery(select);
                            while(rs.next())
                            {
                                String id = rs.getString("id");
                                String user_id = rs.getString("user_id");
                                String name = rs.getString("user_name");
                                String item_id = rs.getString("item_id");
                                String address = rs.getString("delivery_address");
                                out.write("<tr>");
                                out.write("<td>"+ id +"</td>");
                                out.write("<td>"+ user_id +"</td>");
                                out.write("<td>"+ name +"</td>");
                                out.write("<td>"+ item_id +"</td>");
                                out.write("<td>"+ address +"</td>");
                                Date date = new Date();
                                date = rs.getDate("reg_date");
                                out.write("<td>"+ date +"</td>");
                                out.write("</tr>");
                            }
                            con.close();

                        }
                        catch(Exception ex){
                            out.write("Error 404");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="menu4" class="tab-pane fade">
            <h3>Add a catalogue file</h3>
            <form action="upload.jsp" method="POST">
                <div class="form-group">
                    <input type="file" class="form-control" name="catalogue" required>
                </div>
                <button type="submit" class="btn btn-block btn-danger animated bounce">Submit</button>
            </form>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>