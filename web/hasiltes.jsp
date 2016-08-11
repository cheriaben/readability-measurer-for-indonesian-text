<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> </title>
        <style>
		
        .details_table {
	top: 7px;
	left: 220px;
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
	margin: 0px;
	padding-bottom: 100px;
	padding-top: 10px;
	padding-right: 10px;
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
}
        </style>
    </head>
    
    <body>

     
    <table height="269" class="details_table">
        
	
    <tr>
      <td colspan="2"><h2 align="center">Hasil kemampuan anda terhadap bacaan tersebut adalah: ${hasilTes}%</h2></td>
      </tr>
    <tr>
      <td colspan="2"><strong>Hasil analisa:</strong>        </h3></td>
    </tr>
    <tr>
      <td colspan="2">${hasilAnalisa}</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
      <tr>
    <td><div align="center"><strong>Jawaban Anda</strong></div></td>
    <td><div align="center"><strong>Kunci Jawaban</strong></div></td>
    </tr>
    <c:forEach items="${jawabanTes}" varStatus="loop">
    <tr>
    <td><div align="center">
      <c:out value="${jawabanTes[loop.index]}"/>
    </div></td>
    <td><div align="center">
      <c:out value="${kunciTes[loop.index]}"/>
    </div></td>
    </tr>
	</c:forEach>
        

        
    </table>
  
    <div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, MMSI, Viny Christanti M., M.Kom., Cheria Benedicta</div>  
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
