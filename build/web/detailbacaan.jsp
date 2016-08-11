<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Math"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> </title>
        <style>
		
        .details_table {
	top: -1px;
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
	margin: 0px;
	padding: 10px;
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
        <c:forEach items="${listObjek2}" var="objek2" varStatus="counter">
        <tr>
          <td><h1 align="center">${objek2.judul}</h1></td>
        </tr>
        <tr>
          <td><div align="left" class="fontdetail">Pengarang: ${objek2.pengarang}</div></td>
        </tr>
        <tr>
          <td><div align="left"  class="fontdetail">Lexile Framework: ${objek2.lexile}L / Kelas 
            <script type="text/javascript">
					var lex = <c:out value="${objek2.lexile}" />;
         			var value = lex * 0.002;
					var value1 = Math.exp(value);
         			document.write(parseInt(value1, 10));
					</script> 
          </div></td>
        </tr>
        <tr>
          <td><div align="left"  class="fontdetail">Gunning Fog Index: ${objek2.GFI} / Kelas ${objek2.GFI}</div></td>
        </tr>
        <tr>
          <td><div align="left"  class="fontdetail">Batas Suku Kata: ${objek2.batassuku}</div></td>
        </tr>
        <tr>
          <td><div align="left"  class="fontdetail">Stemming: ${objek2.stemming}</div></td>
        </tr>
        <tr>
          <td><div align="left"  class="fontdetail">Tanggal Pengukuran: ${objek2.tanggal}</div></td>
        </tr>
        <tr>
          <td><p align="left">&nbsp;</p>
          <p align="left">${objek2.isi}</p></td>
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
