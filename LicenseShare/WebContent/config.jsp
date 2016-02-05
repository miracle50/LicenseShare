<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sougou.dao.*"%>
<%@ page import="java.text.DecimalFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LicenseShare</title>
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="images/favicon.ico"/>
<script type="text/javascript"> 
<!-- 
function check(){
	if(window.confirm('更新しますか？')){
		return true;
	}else{
		return false;
	}
}
-->
</script>
<style type="text/css">
p.br { line-height: 50%; }
</style>
</head>
<body id="top">

<div id="container">

<br>

<div id="contents">

<div id="main">

<section>
<h2>　</h2>
<div align="center">
<br>
<%
OnlyDAO only=new OnlyDAO();
String userid = request.getRemoteUser();
%>
<form action="UserUpdateServlet" method="post" onSubmit="return check()">
<p class="br"><input type="text" name="userid" value="<%= userid %>" readonly required></p>
<p class="br"><input type="text" name="username" value="<%= only.getUsername(userid) %>" placeholder="名前 入力必須" required><br></p>
<p class="br"><input type="password" name="oldpasswd" value="" placeholder="パスワード 入力必須" maxlength="10" required><br></p>
<p class="br"><input type="password" name="newpasswd1" value="" placeholder="新パスワード1" maxlength="10"><br></p>
<p class="br"><input type="password" name="newpasswd2" value="" placeholder="新パスワード2" maxlength="10"><br></p>
<input type="hidden" name="role" value="<%= only.getRole(userid) %>">
<p class="br"><input type="submit" value="更新">　<input type="reset"></p>
</form>
</div>
</div>
<!--/main-->

<div id="sub">

<div align="center">
<ul class="submenu mb10">
<li><a href="index.jsp">ホーム</a></li>
<li><a href="LicenseListServlet">資格一覧</a></li>
<li><a href="AddLicenseServlet">資格追加</a></li>
<li><a href="ProfileServlet">プロフィール</a></li>
<li><a href="config.jsp">設定</a></li>
<li><a href="logout.jsp">ログアウト</a></li>
</ul>

<%
DecimalFormat df = new DecimalFormat("000000");
only.setAccesscounter();
%>
<ul class="submenu mb10">
<li><a href="#"><%= df.format(only.getAccesscounter()) %></a></li>
</ul>

<ul class="submenu mb10">
<li><a href="CountRankingServlet">総受験回数ランキング</a></li>
<li><a href="PassRankingServlet">総所持資格ランキング</a></li>
</ul>

<%
if(request.isUserInRole("admin")==true){
%>
<ul class="submenu mb10">
<li><a href="admin.jsp">管理者用</a></li>
</ul>
<%
}
%>

<img src="images/logo.png" width="200" height="50">

</div>
</div>
<!--/sub-->

</div>
<!--/contents-->

</div>
<!--/container-->

</body>
</html>