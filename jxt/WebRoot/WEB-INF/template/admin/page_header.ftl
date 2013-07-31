<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>家校通管理平台</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $menuItem = $("#menu .menuItem");
	var $previousMenuItem;
	
	$menuItem.click( function() {
		var $this = $(this);
		if ($previousMenuItem != null) {
			$previousMenuItem.removeClass("current");
		}
		$previousMenuItem = $this;
		$this.addClass("current");
	})

})
</script>
</head>
<body>
	<table width="100%" height="84" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
	  <tr>
	    <td width="100%" height="64" colspan="3"><img src="${base}/template/admin/images/jxt_logo.jpg" width="100%" height="64"></td>
	  </tr>
	  <tr bgcolor="#EEF2FB" nowrap="nowrap">
	    <td width="20%" height="10" align="left" nowrap="nowrap" class="left_txt">
	    	<@sec.authorize ifAnyGranted="ROLE_ADMIN,ROLE_ROLE,ROLE_MESSAGE,ROLE_LOG">
				<li class="menuItem">
					<a href="menu!admin.action" target="menuFrame" hidefocus>管理员</a>，欢迎登录！
				</li>
			</@sec.authorize>
	    </td>
		<td width="60%" align="left" class="left_txt">最新通知： 家校通全新升级，欢迎使用！</td>
		<td width="20%" align="right" nowrap="nowrap">
			<a href="#">消息提醒：（2）</a>&nbsp;&nbsp;
			<a href="admin_profile!edit.action" target="mainFrame">个人信息设置</a>&nbsp;&nbsp;
			<a href="${base}/admin/logout" target="_top">退出</a>&nbsp;&nbsp;
		</td>
	  </tr>
	</table>
</body>
</html>