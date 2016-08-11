<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.lang.Math"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title> </title>
        <style>
                          
            .fixed_headers {
	position: absolute;
	top: 100px;
	width: auto;
	table-layout: fixed;
	border-collapse: collapse;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	left: 61px;
	height: auto;
	overflow: visible;
	margin: 0px;
	padding: 10px;
            }            
            .fixed_headers thead {
	background-color: #003366;
	color: #FFFFFF;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	font-weight: bold;
            }

        
            .fixed_headers tbody tr:nth-child(even) {
	text-align: center;
	background-color: #cccc99;
            }
            .fixed_headers tbody tr:nth-child(odd) {
	text-align: center;
	background-color: #cccccc;
       }
			a:link {
	text-decoration: none;
	color: #000;
	cursor: pointer;
}
a:visited {
	color: #000;
}
a:hover{
	text-decoration: underline;
	font-weight: bolder;
}
.boxtable {
	position: absolute;
	width: 900px;
	height: 500px;
	left: 133px;
	top: -2px;
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
	overflow: hidden;
}

        </style>
    </head>
    
    <body>
    
        <h2 align="center"><span style="font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Hasil Pencarian</span></h2>
         <c:if test="${not empty listObjek4}">
        <table class="fixed_headers" border="1">
            <thead>
            <tr>
                <th width="300">Judul</th>
                <th width="300">Pengarang</th>
                <th width="150">Batas Suku Kata</th>
                <th width="100">Stemming</th>
                <th width="100">Lexile</th>
                <th width="100">GFI</th>
                

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listObjek4}" var="objek4" varStatus="counter">
                <tr>
                    <td width="300"><div align="center"><a href="detailbacaan?idbacaan=${objek4.idbacaan}">${objek4.judul}</a></div></td>
                    <td width="300"><div align="center">${objek4.pengarang}</div></td>
                    <td width="150"><div align="center">${objek4.batassuku}</div></td>
                    <td width="100"><div align="center">${objek4.stemming}</div></td>
                    <td width="100"><div align="center">${objek4.lexile} / Kelas <fmt:parseNumber var="intValue" integerOnly="true" 
                       type="number" value="${Math.pow(Math.E, (objek4.lexile*0.002))}" /> <c:out value="${intValue}" /></div></td>
                    <td width="100"><div align="center">${objek4.GFI}</div></td>


                </tr>
            </c:forEach>
            </tbody>
    </table>
      </c:if>
         <c:if test="${empty listObjek4}">
           <div align="center"><span style="font-size: 18px; font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Kata kunci yang dicari tidak dapat ditemukan!</span></div>
        </c:if>

     
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
