<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body  
{  
    margin: 0;padding: 0;background-color:#DC143C;font-family: 'Arial';  
}  
.login{  
   width: 382px;overflow: hidden;margin: auto;margin: 20 0 0 460px;padding: 80px;background: #fff;border-radius: 15px ;       
}  
h2{  
    text-align: center;color: #fff;padding: 20px;margin-right: 33px;font-family: Cursive,Lucida Handwriting;
}  
label{  
    color: #DC143C;font-size: 17px;font-family: Cursive,Lucida Handwriting;  
}  
#Uname{  
    width: 300px;height: 30px;border-radius: 3px;padding-left: 8px;border-color: #DC143C;font-family: Cursive,Lucida Handwriting;
}  
#Pass{  
    width: 300px;height: 30px;border-radius: 3px;padding-left: 8px;border-color: #DC143C;font-family: Cursive,Lucida Handwriting;       
}  
#log{
    cursor: pointer;color: #fff;font-size: 16px;text-transform: uppercase;
    width: 80px;border: 0;padding: 10px 0;margin-top: 10px;margin-left: -2px;
    border-radius: 5px;background-color: #DC143C;font-family: Cursive,Lucida Handwriting;
}
</style>
</head>
<body>
<script type="text/javascript">  
function matchpass(){  
var un=document.f1.un.value;  
var pw=document.f1.pw.value;  
  
if(un=="admin"&&pw=="1234"){  
return true;  
}  
else{  
alert("Please enter correct login details");  
return false;  
}  
}  
</script>
<h2>Admin Login</h2>
<div class="login">  
<form name="f1" action="adminpage" onsubmit="return matchpass()">  
<label><b>User Name</b></label>
<input id="Uname" type="text" name="un" /><br/><br>  
<label><b>Password</b></label>
<input id="Pass" type="password" name="pw"/><br/>  
<input id="log" type="submit" value="submit">  
</form>
</div>  
</body>
</html>