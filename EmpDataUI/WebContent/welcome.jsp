<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Employee Data</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<style>
			label{
				font-family:sans-serif;
				display:block;
				margin:7px;
				padding-left: 60px;
				padding-top: 10px;
			}
			label.login{
				padding-left: 100px;
				margin-right: 50px;
			}
			span.reset{
				padding-left: 50px;
			}
			span.heading{
				font-family:cursive;
				font-style:italic;
				font-size:30px;
				padding-left:70px;
				padding-bottom: 20px;
				width:420px;
				position: absolute;
			}
			span{
				font-size:20px;
				display:inline-block;
				width:150px;
			}
			
			div.wrapper{
				background-color: bisque;
				border-radius: 10px;
				padding: 20px;
				border-color: red;
				border-width: 3px;
				border-style: solid;
				width: 450px;
				height: 300px;
				margin: auto;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
			}
			body{
				background-color: rgba(0,0,0,0,5);
			}
			input.btn {
				border: 0;
				background-color: #3bab53;
				width: 80px;
				height: 30px;
				font-size: 16px;
				color: white;
			}
		</style>
	</head>
	<body>	
		<div class="wrapper">
			<form method="post" action="Records.jsp" class="demoForm" id="demoForm">
				<span class="heading">Welcome Employee</span>
				<br><br>
				<label>
					<span>All :</span><input type="radio"  name="emp" value="all" id="all" checked><br>
				</label>
				<label>
					<span>ID :</span><input type="radio"  name="emp" value="id" id="id"><br>
				</label>
				<label>
					<span>Name : </span><input onchange="" type="radio"  name="emp" value="name" id="name"><br><br>
				</label>
				<label>
					<span>Enter a Value :</span><input type="text"  name="text" id="text"><br>
				</label>
				<label class="login">
					<input class="btn" type ="submit" value="Submit"/>
					<span class="reset"><input class="btn" type ="reset" value="Reset"></span>
				</label>
			</form>
		</div>
		<script type="text/javascript">
			document.getElementById("demoForm").onsubmit=function myFunction() 
			{
				    // this (keyword) refers to form to which onsubmit attached
				    // 'emp' is name of radio button group
				    var val = getRadioVal(this, 'emp');
				    var input=document.getElementById("text").value;
			    	// validating id
			    	if(val=="id" && (input=="" || isNaN(input)))
			    	{
				    	alert("Enter a valid id");
				    	return false;
			    	}
					// validating id
			    	if(val=="id" && input.length>1)
			    	{
				    	alert("Please type only one number");
				    	return false;
			    	}
			 		// validating name
			    	if(val=="name" && (input=="" || !isNaN(input)))
			    	{
				    	alert("Enter a valid name");
				    	return false;
			    	}
			 		// validating all
			    	if(val=="all" && input.length>0)
			    	{
				    	alert("Don't give input");
				    	return false;
			    	}
			}
			//function getRadioVal() to get value of checked radio button
			function getRadioVal(form, name) 
			{
			    var val;
			    // get list of radio buttons with specified name
			    var radios = form.elements[name];
			    // loop through list of radio buttons
			    for (var i=0, len=radios.length; i<len; i++) {
			        if ( radios[i].checked ) // radio checked?
			        { 
			            val = radios[i].value; // if so, hold its value in val
			            break; // and break out of for loop
			        }
			    }
			    return val; // return value of checked radio or undefined if none checked
			}
		</script>
	</body>
</html>