<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
        .formdetail {
	position: absolute;
	width: 900px;
	height: 603px;
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
.tabeldetail {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 757px;
	left: 75px;
	top: 282px;
}
.copyright {
	background-color: #003366;
	height: 24px;
	width: 1159px;
	position: absolute;
	left: 0px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #FFF;
	bottom: -159px;
}
.picuntar {
	position: absolute;
	left: 239px;
	top: 86px;
}
.picfti {
	position: absolute;
	left: 424px;
	top: 65px;
}
</style>
</head>

<body>
<form class="formdetail" align="center">
<h2 align="center"><span style="font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Tentang</span></h2>
<a class ="picuntar" href="http://untar.ac.id" target="new"><img src="gambar/untar.jpg" width="181" height="181"></a>
<a class ="picfti" href="http://untar.ac.id/fti" target="new"><img src="gambar/fti.png" width="248" height="240"></a>

<c:forEach items="${listObjek5}" var="objek5">
<table width="358" border="0" class="tabeldetail">
  <tr>
    <td width="352">Pengukuran Taraf Sukar Bacaan merupakan website untuk mengukur tingkat kesulitan suatu bacaan dalam Bahasa Indonesia dengan menggunakan metode Lexile Framework dan Gunning Fog Index. Website ini dibuat oleh Cheria Benedicta, Jurusan Teknik Informatika, Fakultas Teknologi Informasi, Universitas Tarumanagara dibawah bimbingan Prof. Dr. Ir. Dali Santun Naga, MMSI dan Viny Christanti Mawardi, M.Kom. pada tahun 2016 sebagai syarat untuk mendapatkan gelar Sarjana Komputer.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
      Total dokumen: ${objek5.totalkorpus}</td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>Total ragam kata dalam dokumen: ${objek5.totaljeniskata}</td>
  </tr>
  <tr>
    <td>Tanggal update dokumen terakhir: ${objek5.tglkorpusterakhir}</td>
  </tr>
  <tr>
    <td>Total bacaan yang telah diukur: ${objek5.totalbacaan}</td>
  </tr>
  <tr>
    <td>Tanggal pengukuran bacaan terakhir: ${objek5.tglbacaanterakhir}</td>
  </tr>
</table>

</c:forEach>
        
</form>
<div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, Viny Christanti M., M.Kom., Cheria Benedicta</div>
</div>
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