<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理菜单 - </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body class="menu">
	<div class="body">
		<@sec.authorize ifAnyGranted="ROLE_ADMIN,ROLE_ROLE">
			<dl>
				<dt>
					<span>管理员&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">管理员列表</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_ROLE">
					<dd>
						<a href="role!list.action" target="mainFrame">角色管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
	</div>
</body>
</html>