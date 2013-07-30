<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商铺列表 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $statusopr = $("#listTable .deleteGoodsCategory");
	
	// 删除商铺分类
	$statusopr.click( function() {
		var option = $statusopr.html();
		if (confirm("您确定要"+option+"此商铺吗?") == false) {
			return false;
		}
	});
})
</script>
</head>
<body class="list goodsCategory">
	<div class="bar">
		商铺列表&nbsp;<span class="pageInfo">总记录数: ${shopsCount}
	</div>
	<div class="body">
		<form id="listForm" action="shop!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='shop!add.action'" value="添加商铺" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th>
						<span>商铺名称</span>
					</th>
					<th>
						<span>所属商区</span>
					</th>
					<th>
						<span>所属分类</span>
					</th>
					<th>
						<span>商铺状态</span>
					</th>
					<th>
						<span>诚信认证</span>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<#list shops as shop>
					<tr>
						<td class="goodsCategoryName">
							${shop.name}
						</td>
						<td>
							${(shop.busiArea.name)!}
						</td>
						<td>
							${(shop.category.name)!}
						</td>
						<td>
							<span class="<#if (shop.status)==1>true<#else>false</#if>Icon">&nbsp;</span>
						</td>
						<td>
							<span class="${shop.isAuth?string('true','false')}Icon">&nbsp;</span>
						</td>
						<td>
							<!--<a href="shop!delete.action?id=${shop.id}" class="deleteGoodsCategory" title="删除">[删除]</a>-->
							<a href="shop!edit.action?id=${shop.id}" title="编辑">[编辑]</a>
							<#if (shop.status)==1>
							[<a class="deleteGoodsCategory" href="shop!status.action?id=${shop.id}">禁用</a>]
							<#else>
							[<a class="deleteGoodsCategory" href="shop!status.action?id=${shop.id}">启用</a>]
							</#if>
						</td>
					</tr>
				</#list>
			</table>
			<#if shopsCount?size == 0>
				<div class="noRecord">没有找到任何记录!</div>
			</#if>
		</form>
	</div>
</body>
</html>