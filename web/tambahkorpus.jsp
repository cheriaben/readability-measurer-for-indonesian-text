<%-- 
    Document   : pengukuran
    Created on : May 20, 2016, 3:07:29 PM
    Author     : Cheria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
    <style type="text/css">
        .formpengukuran {
	width: 600px;
	position: absolute;
	top: 86px;
	left: 277px;
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
	height: 300px;
}
.labeljudul {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 91px;
	left: 272px;
	top: 64px;
}
        .btnproses {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	background-color: #6699cc;
	position: absolute;
	height: 35px;
	width: 250px;
	font-size: 16px;
	left: 176px;
	top: 171px;
	font-weight: bolder;
	color: #FFF;
}
        .titlepengukuran {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	left: 484px;
	top: 2px;
	width: 300px;
}
        .fileteks {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	left: 194px;
	top: 95px;
	font-size: 14px;
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
        <h2 class="titlepengukuran">Tambah Korpus Baru</h2>
<form class="formpengukuran" name="form1" method="post" action="uploadfile.jsp" target="mainFrame" enctype="multipart/form-data">
  <label class="labeljudul">Pilih Korpus</label>
  <input class="fileteks" type="file"  name="teksfiles" multiple>
  <input class="btnproses" name="prosesbtn" type="submit" value="Proses">
      
</form>
<div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, Viny Christanti M., M.Kom., Cheria Benedicta</div>
</div>        
</body>
</html>

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
