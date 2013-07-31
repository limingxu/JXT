<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>开店审核列表 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {
})
</script>
</head>
<body class="list goodsCategory">
	<div class="bar">
		开店审核
	</div>
	<div class="body">
			<table id="listTable" class="listTable">
				<tr>
					<th>
						<span>会员名称</span>
					</th>
					<th>
						<span>商铺名称</span>
					</th>
					<th>
						<span>商区</span>
					</th>
					<th>
						<span>分类</span>
					</th>
					<th>
						<span>商位</span>
					</th>
					<th>
						<span>手机</span>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<#if members??>
				<#list members as member>
					<tr>
						<td>
							${member.username}
						</td>
						<td>
							${(member.shop.name)!}
						</td>
						<td>
							${(member.shop.busiArea.parent.name)!} - ${(member.shop.busiArea.name)!}
						</td>
						<td>
							${(member.shop.category.name)!}
						</td>
						<td>
							${(member.shop.position)!}
						</td>
						<td>
							${(member.shop.mobilePhone)!}
						</td>
						<td>
							<a href="shop!auditDetail.action?id=${member.id}" title="明细">[明细]</a>
						</td>
					</tr>
				</#list>
				</#if>
			</table>
	</div>
</body>
</html>