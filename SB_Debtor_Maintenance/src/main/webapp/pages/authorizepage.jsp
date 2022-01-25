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
td{
  font-family: Cursive,Lucida Handwriting;  
}
h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
} 
table {
	margin-left: 20px;
}
#bn{
   margin-left: 250px;margin-bottom: 10px;margin-top: 10px;
}
#i{
  margin-left: 20px;
}
</style>
    </head>
    <body>
 
         <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT debtordetails.*,date_format(date," %e-%c-%Y & %H:%i ") as date2 from debtordetails where id=?;
            <sql:param value="${param.id}" />
        </sql:query> 
                <h3>DebtorDetails</h3>
                
                <c:forEach var="row" items="${result.rows}" > 
                <table>
                <tr><td id="l" >Debtor Name:</td><td>${row.name}</td></tr>
                <tr><td id="l">Debtor ID:</td><td>${row.id}</td></tr>
                <tr><td id="l">Status:</td><td>${row.status}</td></tr>
                <tr><td id="l">Date & Time of Added/Modified:</td><td>${row.date2}</td></tr>
                </table><br>
                <a id="i" href="viewdetails?id=${row.id}"><button class="btn btn-danger">View Details</button></a><br>
                <div id="bn">
                <a href="adminpage"><button class="btn btn-danger">Cancel</button></a>
                <a href="reject?id=${row.id}"><button class="btn btn-danger">Reject</button></a>
                <a href="authorize?id=${row.id}"><button class="btn btn-danger">Authorize</button></a>
                </div>
                </c:forEach>
                
</body>
</html>