<%@ page contentType="text/html; charset=utf-8" language="java" import="java.lang.Math.*" errorPage="" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Daftar Bacaan</title>
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

ul.tab {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {float: left;}

/* Style the links inside the list items */
ul.tab li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 16px;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}

/* Change background color of links on hover */
ul.tab li a:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
ul.tab li a:focus, .active {
	background-color: #cccccc;
}

/* Style the tab content */
.tabcontent {
    display:none;

}
.copyright {
	background-color: #003366;
	height: 24px;
	width: 1200px;
	position: fixed;
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #FFF;
	padding: 0px;
	margin-top: 200px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	visibility: visible;
	left: 0px;
	bottom: 0px;
}
        </style>
        
    </head>
    
    <body>
    <ul class="tab">
  <li><a href="#" class="tablinks" onClick="openCity(event, 'London')">Semua</a></li>
  <li><a href="#" class="tablinks" onClick="openCity(event, 'Paris')">Dengan Stemming</a></li>
  <li><a href="#" class="tablinks" onClick="openCity(event, 'Tokyo')">Tanpa Stemming</a></li>
</ul>

    
    <div id="London" class="tabcontent">
         <c:if test="${empty listObjek}">
           <div align="center"><span style="font-size: 18px; font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Data Tidak Dapat Ditemukan!</span></div>
        </c:if>
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
            <c:forEach items="${listObjek}" var="objek" varStatus="counter">
                <tr>
                    <td width="300"><div align="center"><a href="detailbacaan?idbacaan=${objek.idbacaan}">${objek.judul}</a></div></td>
                    <td width="300"><div align="center">${objek.pengarang}</div></td>
                    <td width="150"><div align="center">${objek.batassuku}</div></td>
                    <td width="100"><div align="center">${objek.stemming}</div></td>
                    <td width="100"><div align="center">${objek.lexile} / Kelas
					<script type="text/javascript">
					var lex = <c:out value="${objek.lexile}" />;
         			var value = lex * 0.002;
					var value1 = Math.exp(value);
         			document.write(parseInt(value1, 10));
					</script>
					</div></td>
                    <td width="100"><div align="center">${objek.GFI}</div></td>
                    

                </tr>
            </c:forEach>
            </tbody>
      </table>
        
    </div>
    
    
    
    <div id="Paris" class="tabcontent">
    <c:if test="${empty listObjek6}">
           <div align="center"><span style="font-size: 18px; font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Data Tidak Dapat Ditemukan!</span></div>
      </c:if>
           
           <c:if test="${not empty listObjek6}">
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
            <c:forEach items="${listObjek6}" var="objek6" varStatus="counter">
                <tr>
                    <td width="300"><div align="center"><a href="detailbacaan?idbacaan=${objek6.idbacaan}">${objek6.judul}</a></div></td>
                    <td width="300"><div align="center">${objek6.pengarang}</div></td>
                    <td width="150"><div align="center">${objek6.batassuku}</div></td>
                    <td width="100"><div align="center">${objek6.stemming}</div></td>
                    <td width="100"><div align="center">${objek6.lexile} / Kelas<script type="text/javascript">
					var lex = <c:out value="${objek.lexile}" />;
         			var value = lex * 0.002;
					var value1 = Math.exp(value);
         			document.write(parseInt(value1, 10));
					</script></div></td>
                    <td width="100"><div align="center">${objek6.GFI}</div></td>
                    

                </tr>
            </c:forEach>
            </tbody>
        </table>
           </c:if>
    </div>
        
   
    <div id="Tokyo" class="tabcontent">
    <c:if test="${empty listObjek7}">
           <div align="center"><span style="font-size: 18px; font-family: 'Trebuchet MS', Arial, Helvetica, sans-serif;">Data Tidak Dapat Ditemukan!</span></div>
      </c:if>
           
      <c:if test="${not empty listObjek7}">
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
            <c:forEach items="${listObjek7}" var="objek7" varStatus="counter">
                <tr>
                    <td width="300"><div align="center"><a href="detailbacaan?idbacaan=${objek7.idbacaan}">${objek7.judul}</a></div></td>
                    <td width="300"><div align="center">${objek7.pengarang}</div></td>
                    <td width="150"><div align="center">${objek7.batassuku}</div></td>
                    <td width="100"><div align="center">${objek7.stemming}</div></td>
                    <td width="100"><div align="center">${objek7.lexile} / Kelas <script type="text/javascript">
					var lex = <c:out value="${objek.lexile}" />;
         			var value = lex * 0.002;
					var value1 = Math.exp(value);
         			document.write(parseInt(value1, 10));
					</script></div></td>
                    <td width="100"><div align="center">${objek7.GFI}</div></td>
                    

                </tr>
            </c:forEach>
            </tbody>
        </table>
      </c:if>
    </div>

    </body>
</html>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
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
