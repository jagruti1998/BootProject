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
#l{
   color: #DC143C;
}
td {
	font-family: Cursive,Lucida Handwriting;
}
table{
    margin-left: 20px;
}
h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
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
            select debtordetails.*,date_format(date," %e-%c-%Y / %H:%i ") as date2 from sample1.debtordetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
        <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from bankdetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query>

           
                <h3>DebtorDetails</h3>
                <table>
                <c:forEach var="row" items="${result.rows}">
                  <tr><td id="l">Date & Time of Added/Modified:</td><td><c:out value="${row.date2}"/></td></tr>
                  <tr><td id="l">DebtorID:</td><td> <c:out value="${row.id}"/></td></tr>
                  <tr><td id="l">DebtorName:</td><td> <c:out value="${row.name}"/></td></tr>
                  <tr><td id="l">Address Line 1:</td><td>  <c:out value="${row.address1}"/></td></tr>
                    <tr><td id="l">Address Line 2:</td><td>  <c:out value="${row.address2}"/></td></tr>
                    <tr><td id="l">Fax Number:</td><td>  <c:out value="${row.faxno}"/></td></tr>
                    <tr><td id="l">Phone Number:</td><td>  <c:out value="${row.phno}"/> </td></tr>
                    <tr><td id="l">E-Mail ID:</td><td>  <c:out value="${row.email}"/></td></tr>
                </c:forEach>
                </table>
                
                <h3>BankDetails</h3>
                <table>
                <c:forEach var="row" items="${result2.rows}">
                  <tr><td id="l">Bank Name:</td><td><c:out value="${row.name}"/></td></tr>
                  <tr><td id="l">Branch Name:</td><td><c:out value="${row.branch}"/></td></tr>
                  <tr><td id="l">Swift Address:</td><td><c:out value="${row.address}"/></td></tr>
                  <tr><td id="l">Account Number:</td><td><c:out value="${row.accno}"/></td></tr>
                    <tr><td id="l">Currency Type:</td><td><c:out value="${row.curr}"/></td></tr>
                </c:forEach>
                </table><br>
        <a href="select?id=${param.id}"><button class="btn btn-danger">Go Back</button></a>
    
</body>
</html>