<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> </title>
        <style>
		
        .details_table {
	top: 26px;
	left: 222px;
	width: 713px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	height: 77px;
	overflow: auto;
	background: #FFFFFF;
	color: #000000;
	-webkit-box-shadow: 0px 0px 8px 2px #d1d1d1;
	-moz-box-shadow: 0px 0px 8px 2px #d1d1d1;
	box-shadow: 0px 0px 8px 2px #d1d1d1;
	-webkit-border-top-left-radius: 0px;
	-webkit-border-top-right-radius: 0px;
	-webkit-border-bottom-right-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-moz-border-radius-topleft: 0px;
	-moz-border-radius-topright: 0px;
	-moz-border-radius-bottomright: 6px;
	-moz-border-radius-bottomleft: 6px;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 6px;
	border-bottom-left-radius: 6px;
	overflow: visible;
	margin: 10px;
	padding-top: 10px;
	padding-right: 10px;
	padding-bottom: 50px;
	padding-left: 10px;
}
        .fontdetail {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 20px;
	font-weight: bold;
	color: #000;
}
.copyright {
	background-color: #003366;
	height: 24px;
	width: 1200px;
	position: fixed;
	left: 0px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #FFF;
	bottom: 0px;
	padding: 0px;
}
        .btnlanjut {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	background-color: #6699cc;
	position: relative;
	height: 35px;
	width: 250px;
	font-size: 16px;
	font-weight: bolder;
	color: #FFF;
	bottom: 0px;
}
.formformat{
	position: relative;
	height: auto;
	width: auto;
	margin: 0px;
	padding-top: 0px;
	padding-right: 0px;
	padding-bottom: 0px;
	padding-left: 200px;
}
        </style>
    </head>
    
    <body>
     
    <table height="269" class="details_table" id='TextBoxesGroup'>
      <c:forEach items="${listObjek9}" var="objek9" varStatus="counter">
      
        <tr>
            <td><strong>Isilah Isian Berikut!</strong></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><p align="left">${objek9.soal}</p></td>
        </tr>
        <fmt:parseNumber var="intValue" integerOnly="true" 
                       type="number" value="${objek9.totalsoal+1}" /> 
        
    <tr><td>&nbsp;</td></tr>
  
 <tr><td>
<form id='ButtonG' class="formformat" action="hasiltes" method="post">
    <input type="hidden" name="txtidsoal" value="${objek9.idsoal}">
  </c:forEach>
    <script type="text/javascript">    
$(document).ready(function(){
 
    var counter = 1;
	
	var s= <c:out value="${intValue}" />
 
	while(counter<s){   
 
	var newTextBoxDiv = $(document.createElement('div'));
 
	newTextBoxDiv.after().html('<label>Kata #'+ counter + ' : </label>' +
	      '<input type="text" name="textbox' + counter + 
	      '" id="textbox' + counter + '" value="" >');
 
	newTextBoxDiv.appendTo("#ButtonG");
 
 
	counter++;
	}
	var newButton = $(document.createElement('input')).attr("type", "submit").attr("value", "Selesai").attr("class", "btnlanjut");
	newButton.appendTo("#ButtonG");	
     
  });
 </script>
 
 </form>
</td></tr>
 </table> 

    
    

    <div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, MMSI, Viny Christanti M., M.Kom., Cheria Benedicta    </div>  
</body>

</html>
<script>
    var a = '${msg}';
    if(a != '') {
        alert(a);
    }
</script>
<%
    String msg = (String) request.getParameter("msg");
    if(msg != null) {
%>
<script>
    alert('<%=msg%>');
</script>
<%
    }
%>
