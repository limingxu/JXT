<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script src="${base}/template/admin/js/prototype.lite.js" type="text/javascript"></script>
<script src="${base}/template/admin/js/moo.fx.js" type="text/javascript"></script>
<script src="${base}/template/admin/js/moo.fx.pack.js" type="text/javascript"></script>

<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(${base}/template/admin/images/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(${base}/template/admin/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(${base}/template/admin/images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(${base}/template/admin/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(${base}/template/admin/images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
	<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
	  <tr>
	    <td width="182" valign="top"><div id="container">
	    
	    <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	      <h1 class="type"><a href="javascript:void(0)">信息管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="${base}/template/admin/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="message!send.action" target="mainFrame">发送通知</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">发送学生成绩</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">短信发送查询</a></li>
	        </@sec.authorize>
	        </ul>
	      </div>
		</@sec.authorize>
	      
	    <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	      <h1 class="type"><a href="javascript:void(0)">校务管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="${base}/template/admin/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="school!list.action" target="mainFrame">学校管理</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">教师管理</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">学校信息员管理</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">班级管理</a></li>
	        </@sec.authorize>
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">学生家长管理</a></li>
	        </@sec.authorize>
	        </ul>
	      </div>
	    </@sec.authorize>
	      
	    <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	      <h1 class="type"><a href="javascript:void(0)">业务管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="${base}/template/admin/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			  <li><a href="admin!list.action" target="mainFrame">查询服务状态</a></li>
			</@sec.authorize>
			<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="role!list.action" target="mainFrame">代理商管理</a></li>
	        </@sec.authorize>
	        </ul>
	      </div>
	    </@sec.authorize>
	      
	    <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	      <h1 class="type"><a href="javascript:void(0)">内部管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="${base}/template/admin/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="#" target="main">人员管理</a></li>
	        </@sec.authorize>
	        </ul>
	      </div>
	    </@sec.authorize>

		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	      <h1 class="type"><a href="javascript:void(0)">公告及申请</a></h1>
	      <div class="content">
	          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td><img src="${base}/template/admin/images/menu_topline.gif" width="182" height="5" /></td>
	            </tr>
	          </table>
	        <ul class="MM">
	        <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
	          <li><a href="#" target="main">公告及申请</a></li>
	        </@sec.authorize>
	        </ul>
	      </div>
		</@sec.authorize>
		
	<script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
		</td>
	  </tr>
	</table>
</body>
</html>