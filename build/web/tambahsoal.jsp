<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">    
$(function(){
  $('#txt').keypress(function(e){
    if(e.which == 92 || e.which ==47 || e.which ==58 || e.which ==42 || e.which ==63 || e.which ==34 || e.which ==60 || e.which ==62 || e.which ==124) { 
	return false;
	} else {
      return true;
    }
  });
});
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
        <style type="text/css">
		.copyright {
	background-color: #003366;
	height: 24px;
	width: 1156px;
	position: absolute;
	left: 0px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #FFF;
	bottom: -616px;
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
	height: 950px;
}
.labeljudul {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 88px;
	top: 55px;
}

.labeltotal {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 94px;
	top: 819px;
}
.labeltingkat{
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 200px;
	left: 88px;
	top: 126px;
}
.labelpengarang {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 89px;
	top: 89px;
}
.labelteks {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 90px;
	top: 155px;
}
.labelsoal {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 90px;
	top: 395px;
}
.labeljwb {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	position: absolute;
	width: 100px;
	left: 90px;
	top: 636px;
}

.txtjudul {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 300px;
	position: absolute;
	left: 217px;
	top: 55px;
}

.txttotal {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 150px;
	position: absolute;
	left: 217px;
	top: 819px;
} 
.txttingkat {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 150px;
	position: absolute;
	left: 276px;
	top: 128px;
}
.txtpengarang {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 20px;
	width: 300px;
	position: absolute;
	left: 218px;
	top: 91px;
}
        .txtareateks {
	height: 200px;
	width: 425px;
	position: absolute;
	left: 91px;
	top: 182px;
}
        .txtareasoal {
	height: 200px;
	width: 425px;
	position: absolute;
	left: 91px;
	top: 422px;
}
        .txtareajwb {
	height: 137px;
	width: 425px;
	position: absolute;
	left: 91px;
	top: 663px;
}
        .btnproses {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	background-color: #6699cc;
	position: absolute;
	height: 35px;
	width: 250px;
	font-size: 16px;
	left: 180px;
	top: 879px;
	font-weight: bolder;
	color: #FFF;
}
        .titlepengukuran {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	left: 484px;
	top: 30px;
}
        </style>       
</head>
    <body>
    <h2 class="titlepengukuran">Tambah Soal Baru</h2>
    <form class="formpengukuran" name="form1" method="post" action="tambahsoal" target="mainFrame">
      <label class="labeljudul">Judul</label><input class="txtjudul" type="text" name="judultxt" id="txt">
      <label class="labelpengarang">Pengarang</label><input class="txtpengarang"name="pengarangtxt" type="text">
      <label class="labeltingkat">Tingkat Kesulitan (Kelas)</label><input class="txttingkat" type="text" name="tingkattxt" id="txt">
      <label class="labelteks">Teks</label><textarea class="txtareateks" name="tekstxtarea" cols="" rows=""></textarea>
      <label class="labelsoal">Soal</label><textarea class="txtareasoal" name="soaltxtarea" cols="" rows=""></textarea>
      <label class="labeljwb">Jawaban</label><textarea class="txtareajwb" name="jwbtxtarea" cols="" rows=""></textarea>
      <label class="labeltotal">Jumlah Soal</label><input class="txttotal" type="text" name="totaltxt" id="txt">
      <input class="btnproses" name="prosesbtn" type="submit" value="Proses">
    </form>
<div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, Viny Christanti M., M.Kom., Cheria Benedicta</div>    
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