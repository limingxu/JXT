<<<<<<< HEAD
<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body class="menu">
	<div>
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>管理员管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">下辖管理员</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!add.action" target="mainFrame">添加管理员</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>信息管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="message!send.action" target="mainFrame">发送通知</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">发送学生成绩</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">短信发送查询</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>校务管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="school!list.action" target="mainFrame">学校管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">教师管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">学校信息员管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">班级管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">学校信息员管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
			
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>业务管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">查询服务状态</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">代理商管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
	   <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>内部管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">人员管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
		  <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>公告及申请&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">公告及申请</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
	</div>
</body>
=======
<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body class="menu">
	<div>
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>管理员管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">下辖管理员</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!add.action" target="mainFrame">添加管理员</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>信息管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="message!send.action" target="mainFrame">发送通知</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">发送学生成绩</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">短信发送查询</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>校务管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="school!list.action" target="mainFrame">学校管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">教师管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">学校信息员管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">班级管理</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">学校信息员管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
			
		<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>业务管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">查询服务状态</a>
					</dd>
				</@sec.authorize>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="role!list.action" target="mainFrame">代理商管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
	   <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>内部管理&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">人员管理</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
		  <@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
			<dl>
				<dt>
					<span>公告及申请&nbsp;</span>
				</dt>
				<@sec.authorize ifAnyGranted="ROLE_SYS_ADMIN">
					<dd>
						<a href="admin!list.action" target="mainFrame">公告及申请</a>
					</dd>
				</@sec.authorize>
			</dl>
		</@sec.authorize>
		
	</div>
</body>
>>>>>>> branch 'master' of https://github.com/limingxu/JXT.git
</html>
