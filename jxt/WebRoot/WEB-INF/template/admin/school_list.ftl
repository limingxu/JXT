<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>

<body class="list">
	<div class="bar">
		学校管理
	</div>
	<div class="body">
		<form id="listForm" action="admin!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='school!add.action'" value="添加学校" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<p name="username" hidefocus>学校名称</p>
					</th>
					<th>
						<p name="email" hidefocus>所属代理商</p>
					</th>
					<th>
						<p name="name" hidefocus>行政区域</p>
					</th>
					
					<th>
						<p name="loginDate" hidefocus>联系方式</p>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
					<#list pager.result as school>
					<tr> 
						<td>
							<input type="checkbox" name="ids" value="1" />
						</td>
						<td>
							${(school.name)!}
						</td>
						<td>
							${(school.agent.name)!}
						</td>
						<td>
							${(school.city.name)!}-${(school.district.name)!}
						</td>
						<td>
							${(school.description)!}
						</td>
						<td>
							<a href="school!edit.action?id=${(school.id)!}" title="修改">[修改]</a>
							<a href="school!cancel.action?id=${(school.id)!}" title="取消">[取消]</a>
						</td>
					</tr>
			    </#list> 
			</table>
			<#if (pager.result?size > 0)>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="admin!delete.action" value="删 除" disabled hidefocus />
					</div>
					<div class="pager">
						<#include "/WEB-INF/template/admin/pager.ftl" />
					</div>
				<div>
			<#else>
				<div class="noRecord">没有找到任何记录!</div>
			</#if>
		</form>
	</div>
</body>
</html>