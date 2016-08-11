<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.btncari {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	background-color: #6699cc;
	position: absolute;
	height: 35px;
	width: 250px;
	font-size: 16px;
	left: 183px;
	top: 223px;
	font-weight: bolder;
	color: #FFF;
}
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
	width: 100px;
	left: 72px;
	top: 55px;
}
.labelto {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 282px;
	top: 162px;
}
.labelpengarang {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 73px;
	top: 89px;
}
.titlepengukuran {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	left: 484px;
	top: 2px;
	width: 300px;
}
.txtjudul {	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 300px;
	position: absolute;
	left: 217px;
	top: 55px;
}
.txtrange1 {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 50px;
	position: absolute;
	left: 218px;
	top: 163px;
}
.txtrange2 {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 50px;
	position: absolute;
	left: 344px;
	top: 164px;
}
.txtpengarang {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 300px;
	position: absolute;
	left: 217px;
	top: 91px;
}
.txtmeasurement {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	position: absolute;
	height: 25px;
	width: 200px;
	left: 218px;
	top: 124px;
}
.labelmeasurement {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 150px;
	left: 74px;
	top: 125px;
}
.labelrange {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 150px;
	left: 75px;
	top: 162px;
}

.txtmeasurement {	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	position: absolute;
	height: 25px;
	width: 200px;
	left: 218px;
	top: 124px;
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
<h2 class="titlepengukuran">Pencarian Lanjutan</h2>
<form action="pencarianlanjut" class="formpengukuran" method="post" name="form1" id="form1" target="mainFrame">
  <label class="labeljudul">Judul</label>
  <input class="txtjudul" type="text" name="judultxt" />
  <label class="labelpengarang">Pengarang</label>
  <input class="txtpengarang"name="pengarangtxt" type="text" />
  <input class="btncari" name="prosesbtn" type="submit" value="Cari" />
<label class="labelmeasurement">Satuan Pengukuran</label>
<select class="txtmeasurement" name="measurementtxt" id="measurementtxt">
  <option value="Lexile">Lexile Framework</option>
  <option value="GFI">Gunning Fog Index</option>
</select>
<label class="labelrange">Range</label>
<input class="txtrange1" type="text" name="range1txt" id="range1txt" /><label class="labelto">sampai</label>
<input class="txtrange2" name="range2txt" type="text" id="range1txt"/>

</form>
<div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, Viny Christanti M., M.Kom., Cheria Benedicta</div>
</body>
</html>