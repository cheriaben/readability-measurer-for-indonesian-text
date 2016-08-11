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
	top: 86px;
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
        .btnlanjut {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	background-color: #6699cc;
	position: static;
	height: 35px;
	width: 250px;
	font-size: 16px;
	font-weight: bolder;
	color: #FFF;
}
.formformat{
	position: static;
	height: 40px;
	width: 260px;
	padding-top: 10px;
	padding-right: 10px;
	padding-bottom: 10px;
	padding-left: 200px;
}
        .judulpage {
	font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
}
        </style>
    </head>
    
    <body>
    <h2 align="center" class="judulpage">Pengukuran Kemampuan Membaca</h2>
    <table height="269" class="details_table">
      <c:forEach items="${listObjek8}" var="objek8" varStatus="counter">
        <tr>
          <td>Bacalah Bacaan Berikut dengan Seksama!</td>
        </tr>
        <tr>
          <td><h3 align="center">${objek8.judul}</h3></td>
        </tr>
        <tr>
          <td><p align="left">Tingkat Kesulitan: Kelas ${objek8.tingkat}</h3></td>
        </tr>
        <tr>
          <td><p align="left">Pengarang: ${objek8.pengarang}</p></td>
        </tr>
        <tr>
          <td><p align="left">${objek8.teks}</p></td>
        </tr>
        
        <tr>
          <td>
          <form class="formformat" action="soal?idsoal=${objek8.idsoal}" method="post">
    <input class="btnlanjut" name="lanjutbtn" type="submit" value="Selanjutnya"></form></td>
    </tr>
        </c:forEach>
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
