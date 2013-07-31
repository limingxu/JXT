<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商区列表 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $deleteBusiArea = $("#listTable .deleteGoodsCategory");
	var $busiAreaName = $("#listTable .goodsCategoryName");
	
	// 删除商品分类
	$deleteBusiArea.click( function() {
		if (confirm("您确定要删除此商区吗?") == false) {
			return false;
		}
	});
	
	// 树折叠
	$busiAreaName.click( function() {
		var grade = $(this).parent().attr("grade");
		var isHide;
		$(this).parent().nextAll("tr").each(function(){
			var thisLevel = $(this).attr("grade");
			if(thisLevel <=  grade) {
				return false;
			}
			if(isHide == null) {
				if($(this).is(":hidden")){
					isHide = true;
				} else {
					isHide = false;
				}
			}
			if( isHide) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});

})
</script>
</head>
<body class="list goodsCategory">
	<div class="bar">
		商区列表&nbsp;<span class="pageInfo">总记录数: ${tree?size}
	</div>
	<div class="body">
		<form id="listForm" action="busi_area!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='busi_area!add.action'" value="添加商区" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th>
						<span>商区名称</span>
					</th>
					<th>
						<span>排序/楼层</span>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<#list tree as busiArea>
					<tr grade="${busiArea.grade}">
						<td class="goodsCategoryName">
							<#if busiArea.grade == 1>
								<span class="pointer firstCategory" style="margin-left: ${busiArea.grade * 20}px;">
									${busiArea.name}
								</span>
							<#else>
								<span class="pointer category" style="margin-left: ${busiArea.grade * 20}px;">
									${busiArea.name}
								</span>
							</#if>
						</td>
						<td>
							${busiArea.sort} <span><#if (busiArea.parent !=null)> 层</#if></span>
						</td>
						<td>
							<#if (busiArea.children?size > 0)>
								<span title="无法删除">[删除]</span>
							<#else>
								<a href="busi_area!delete.action?id=${busiArea.id}" class="deleteGoodsCategory" title="删除">[删除]</a>
							</#if>
							<a href="busi_area!edit.action?id=${busiArea.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
				</#list>
			</table>
			<#if tree?size == 0>
				<div class="noRecord">没有找到任何记录!</div>
			</#if>
		</form>
	</div>
</body>
</html>