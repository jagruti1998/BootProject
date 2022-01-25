<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<h3>Edit Bank Details</h3>   
<form:form  action="updateBank"  modelAttribute="edit">

	<table>
	<tr class="form-group"> 
		<td><form:hidden path="id" /></td> 
	</tr>
	<tr class="form-group">
		<td><form:label path="name">Bank Name:</form:label></td>
		<td><form:input id="i" path="name" class="form-control"/></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="branch">Branch:</form:label></td>
		<td><form:input id="i" path="branch" class="form-control"/></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="address">Swift address:</form:label></td>
		<td><form:input id="i" path="address" class="form-control"/></td> 
	</tr>
	
	<tr class="form-group">
		<td><form:label path="accno">Account Number:</form:label></td>
		<td><form:input id="i" path="accno" class="form-control"/></td> 
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
			<input class="btn btn-danger" type="submit" value="Submit"/>
		</div>
	</form:form>
	<a href="view"><button class="btn btn-danger">Back</button></a>
</body>
</html> 