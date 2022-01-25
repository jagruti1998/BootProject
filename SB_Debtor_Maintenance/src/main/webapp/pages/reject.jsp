<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reasone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
}
#i{
     border-color: #DC143C;width: 30%;margin-left: 20px;font-family: Cursive,Lucida Handwriting; 
}
#s{
     margin-left: 20px;margin-top: 20px;
}
</style>
</head>
<body>
<h3>Reject Reason</h3>
<form action="reason">
<input type="hidden" name="id" value="${param.id}"/>
<input id="i" class="form-control" type="text" name="reason">
<input id="s" class="btn btn-danger" type="submit" value="submit">
</form>
</body>
</html>