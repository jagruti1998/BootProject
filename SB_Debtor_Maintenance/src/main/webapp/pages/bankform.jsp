<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
body{
   margin-left: 20px;
}
label{  
    color: #DC143C;font-size: 17px;font-family: Cursive,Lucida Handwriting;  
}
input,select{
	font-family: Cursive,Lucida Handwriting;  
} 
#i{
     border-color: #DC143C;
}
#rs{
   color: #DC143C;border-color: #DC143C;
}
#bn{
   margin-left: 250px;margin-bottom: 10px;margin-top: 10px;
}
h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
}
</style>
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sample1"
                           user="root"  password="root"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from debtordetails where phno=?;
            <sql:param value="${param.phno}" />
        </sql:query>
<h3>Enter the Bank Details</h3>          
<form:form  action="addBank" modelAttribute="bk"> 
<table>
	<c:forEach var="row" items="${result.rows}" >
<td><form:hidden path="id" value="${row.id}" /></td>
</c:forEach>  
	<tr class="form-group">
		<td><form:label path="name">Bank Name:</form:label></td>
		<td><form:input id="i" path="name" class="form-control" /></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="branch">Branch:</form:label></td>
		<td><form:input id="i" path="branch" class="form-control" /></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="address">Swift address:</form:label></td>
		<td><form:input id="i" path="address" class="form-control" /></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="accno">Account Number:</form:label></td>
		<td><form:input id="i" path="accno" class="form-control" /></td> 
	</tr>
	<tr class="form-group">
	<td><form:label path="curr">Currency Type:</form:label></td>
	<td>
       <form:select id="i" path="curr" class="form-control">
        <form:option value="None" label="Select"/>  
        <form:option value="USD" label="USD"/>  
        <form:option value="RUB" label="RUB"/>
        <form:option value="INR" label="INR"/>  
        <form:option value="EUR" label="EUR"/>  
        <form:option value="PKR" label="PKR"/>
        <form:option value="Other" label="Other"/>
        </form:select></td>
    </tr>
</table>	
<div id="bn">	
			<input id="rs" class="btn btn-light" type="reset"  value="Clear">
			<input class="btn btn-danger" type="submit" type="submit"  value="Submit"/>
</div>
</form:form>
</body>
</html>