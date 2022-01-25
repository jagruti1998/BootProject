<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
<style type="text/css">
#l{
   color: #DC143C;
}
td{
  font-family: Cursive,Lucida Handwriting;  
}
table {
	margin-left: 25px;
}
#bn{
  margin-left: 150px;margin-top: 20px;margin-bottom: 20px; 
}
h3{
    color: #DC143C;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
}  
</style>
</head>
<body>
<h3>Review</h3> 
<table>
<tr><td id="l">Transaction Reference No:</td><td><p id="transno"></p></td></tr>
<tr><td id="l">Date:</td><td><p id="date"></p></td></tr>
<tr><td id="l">Status:</td><td>P (Pending)</td></tr>
<tr><td id="l">Transaction Information:</td><td>Transaction was successful</td></tr>
</table>
<a id="bn" href="added"><button id="bn" class="btn btn-danger">Confirm</button></a>

<script type="text/javascript">
document.getElementById("transno").innerHTML=Math.floor(Math.random()*1000000000);
d=new Date();
document.getElementById("date").innerHTML=d.getDate()+"/"+(d.getMonth()+1)+"/"+d.getFullYear();
</script>
</body>
</html>