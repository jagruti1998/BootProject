<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>View</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
h2{  
    text-align: center;color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
}
th{
    color: #DC143C;font-family: Cursive,Lucida Handwriting;
}
td{
    font-size:medium;font-family: Cursive,Lucida Handwriting;
}
button {
	cursor: pointer;color: #fff;font-size: 16px;text-transform: uppercase;
    width: 80px;border: 0;padding: 10px 0;margin-top: 10px;margin-left: -2px;border-radius: 5px;
     background-color: #DC143C;font-family: Cursive,Lucida Handwriting;
}
#back{
     margin-left: 20px;margin-bottom: 30px;
}    
</style> 
    </head>
    <body>
 
         <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            select debtordetails.*,date_format(date," %e-%c-%Y / %H:%i ") as date2 from sample1.debtordetails
            order by date desc;
        </sql:query>

        <h2>DebtorDetails</h2><br>

            <table  class="table table-bordered">
                
                <tr>
                    <th scope="col">DebtorID</th>
                    <th scope="col">Date & Time of Added/Modified</th>
                    <th scope="col">DebtorName</th>
                    <th scope="col">Address Line 1</th>
                    <th scope="col">Address Line 2</th>
                    <th scope="col">Fax Number</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">E-Mail ID</th>
                    <th scope="col">Status</th>
                    <th scope="col">Reason</th>
                    <th scope="col" colspan="4">Modify and more</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                      <th scope="row"><c:out value="${row.id}"/></th>
                       <td><c:out value="${row.date2}"/></td>
                        <td><c:out value="${row.name}"/></td>
                         <td><c:out value="${row.address1}"/></td>
                          <td><c:out value="${row.address2}"/></td>
                            <td><c:out value="${row.faxno}"/></td>
                              <td><c:out value="${row.phno}"/></td>
                                <td><c:out value="${row.email}"/></td>
                                <td><c:out value="${row.status}"/></td>
                                  <td><c:out value="${row.reason}"/></td>
                        <td><a href="viewaccount?id=${row.id}"><button>View Bank</button></a></td>
                        <td><a href= "editdebtor?id=${row.id}"><button>Edit Debtor</button></a></td>
                        <td><a href= "editbank?id=${row.id}"><button>Edit Bank</button></a></td> 
                        <td><a href= "remove?id=${row.id}"><button>remove</button></a></td>
                    </tr>
                </c:forEach>
            </table>
        <a  href="userpage"><button id="back">Go Back</button></a>
    
</body>
</html>