<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>开店审核详情 - Powered By </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body class="input">
	<div class="bar">
		开店审核详情
	</div>
	<div class="body">
			<table class="inputTable">
				<tr>
					<th>
						会员名称: 
					</th>
					<td>
					    ${member.username}
					</td>
				</tr>
				<tr>
					<th>
						商铺名称: 
					</th>
					<td>
					    ${(member.shop.name)!}
					</td>
				</tr>
				<tr>
					<th>
						商位: 
					</th>
					<td>
					    ${(member.shop.position)!}
					</td>
				</tr>
				<tr>
					<th>
						商区: 
					</th>
					<td>
					    ${(member.shop.busiArea.parent.name)!} - ${(member.shop.busiArea.name)!}
					</td>
				</tr>
				<tr>
					<th>
						分类: 
					</th>
					<td>
					    ${(member.shop.category.name)!}
					</td>
				</tr>
				<tr>
					<th>
						手机: 
					</th>
					<td>
					    ${(member.shop.mobilePhone)!}
					</td>
				</tr>
				<tr>
					<th>
						身份证: 
					</th>
					<td>
						<img src="${base}${(member.idcardUrl)!}" style="width: 500px; height: 260px;" />
					</td>
				</tr>
				<tr>
					<th>
						营业执照: 
					</th>
					<td>
						<img src="${base}${(member.salercardUrl)!}" style="width: 500px; height: 260px;" />
					</td>
				</tr>
				<tr>
					<th>
						申请说明: 
					</th>
					<td>
						<textarea class="formTextarea" readonly> ${(member.requestDesc)!} </textarea>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<a href="shop!allow.action?id=${member.id}" class="formButton">同    意</a>&nbsp;&nbsp;
				<a href="shop!reject.action?id=${member.id}" class="formButton">拒   绝</a>
			</div>
	</div>
</body>
</html>