<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>SELECT Operation</title>
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
            select row_number() over() as no,date_format(date," %e-%c-%Y / %H:%i ") as date2,status,name,id from sample1.debtordetails
            order by date desc;
        </sql:query>

        <h3>Select the Debtor</h3>
        <form>
            <table class="table table-bordered">
                <tr>
                    <th scope="col">sno</th>
                    <th scope="col">Date & Time</th>
                    <th scope="col">Debtor Name</th>
                    <th scope="col">Status</th>
                    <th scope="col">action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                       <td><c:out value="${row.no}"/></td>
                       <td><c:out value="${row.date2}"/></td>
                       <td><c:out value="${row.name}"/></td>
                       <td><c:out value="${row.status}"/></td>
                       <td><a href="select?id=${row.id}" class="btn btn-danger">select</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="/" class="btn btn-danger">Log Out</a>
    
</body>
</html>