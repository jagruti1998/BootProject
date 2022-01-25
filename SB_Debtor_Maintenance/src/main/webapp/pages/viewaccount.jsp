<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head><title>Bank Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       <style type="text/css">
         h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
          }
          th{
    color: #DC143C;font-family: Cursive,Lucida Handwriting;
           }
           td{
    font-size:medium;font-family: Cursive,Lucida Handwriting;
}
         a{
           margin-left: 20px;
         }
       </style> 
    </head>
    <body>
 
         <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from bankdetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
    <h3>Bank Details</h3>
        <form>
            <table class="table table-bordered">
                <tr>
                    <th scope="col">Bank Name</th>
                    <th scope="col">Branch Name</th>
                    <th scope="col">Swift Address</th>
                    <th scope="col">Account Number</th>
                    <th scope="col">Currency Type</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.branch}"/></td>
                         <td><c:out value="${row.address}"/></td>
                          <td><c:out value="${row.accno}"/></td> 
                           <td><c:out value="${row.curr}"/></td> 
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="view" class="btn btn-danger">Go Back</a>
    
</body>
</html>