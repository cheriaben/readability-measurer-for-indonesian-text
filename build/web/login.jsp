<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" href="gambar/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tes Keterbacaan - Masuk</title>
<style type="text/css">
.formlogin {
	width: 400px;
	position: absolute;
	top: 87px;
	left: 513px;
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
	height: 400px;
}
.login_button {
	position: absolute;
	height: 40px;
	width: 250px;
	left: 75px;
	top: 316px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 18px;
	color: #FFF;
	background-color: #003366;
	border-top-color: #006;
	border-right-color: #006;
	border-bottom-color: #006;
	border-left-color: #006;
	font-weight: bolder;
}

.label_user {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #000;
	position: absolute;
	left: 63px;
	width: 200px;
	top: 136px;
}
.label_pass {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #000;
	position: absolute;
	width: 100px;
	top: 213px;
	left: 61px;
}
.textfieldbox {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 30px;
	width: 280px;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;
	outline: none;
	border: 1px solid #DDDDDD;
	padding-left: 10px;
	position: absolute;
	top: 165px;
	left: 62px;
}
.passfieldbox {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 14px;
	height: 30px;
	width: 280px;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;
	outline: none;
	border: 1px solid #DDDDDD;
	padding-left: 10px;
	position: absolute;
	top: 240px;
	left: 62px;
}
.textfieldbox:focus {
	box-shadow: 0px 0px 5px rgba(81, 203, 238, 1);

	border: 1px solid rgba(141,220,243,1);
}	

.passfieldbox:focus {
	box-shadow: 0px 0px 5px rgba(81, 203, 238, 1);
	border: 1px solid rgba(141,220,243,1);
}
.linklupapass {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	position: absolute;
	left: -211px;
	top: 176px;
	text-decoration: none;
	color: #FFF;
	cursor: pointer;
}

.copyright {
	background-color: #003366;
	height: 24px;
	width: 1366px;
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
<form action="login" method="post" name="form1" target="_parent" class="formlogin" id="form1">
<h6 align="center"><img src="gambar/title2.png" width="190" height="105"/></h6>
  <label class="label_user">Nama Pengguna</label>
  <input class="textfieldbox" type="text" name="usernametxt" id="usernametxt" />
  <label class="label_pass">Kata Sandi</label>
  <input class="passfieldbox" type="password" name="passtxt" id="passtxt" />
  <a class="linklupapass" href="lupapass.jsp" title="Reset Kata Sandi" target="_self">Lupa Kata Sandi?</a>
  <input class="login_button" type="submit" name="loginbtn" id="loginbtn" value="Masuk" />
</form>
<div></div>
</body>
<div class="copyright" align="center">Copyright © 2016 Prof. Dr. Ir. Dali S. Naga, Viny Christanti M., M.Kom., Cheria Benedicta</div>
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