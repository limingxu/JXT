<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>安徽联通家校通 </title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript" src="${base}/template/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready( function() {
	$(".timeType").click( function() {
		if ($(this).val() == "1") {
			$(".sentDate").show();
		} else {
			$(".sentDate").hide();
		}
	})
});
</script>

</head>
<body class="list">
	<div class="body">
		<form id="listForm" action="admin!list.action" method="post">
			<div class="listBar">
				<select name="pager.searchBy">
					<option value="username"<#if pager.searchBy == "username"> selected</#if>>
						用户名
					</option>
					<option value="name"<#if pager.searchBy == "name"> selected</#if>>
						姓名
					</option> 
				</select>
			</div>
			<!-- 
			<div>
				发送对象：   <input type="radio" name ="sendType" value="0" checked/>所有家长  <input type="radio" name="sendType" value="1"/> 单个家长
			</div>
			-->
			<div class="body">
					发送时间：   <input type="radio" id="timeType" name ="timeType" value="0" checked/> 即时发送 
					<input type="radio" id="timeType"  name="timeType" value="1"/> 定时发送 <input type="text" id="sentDate" name="sentDate" class="formText" value="${(sentDate?string("yyyy-MM-dd HH:mm:ss"))!}"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',lang:'zh-cn'})" />
			</div>
			
			<table id="listTable" class="listTable">
				<tr>
					<th class="check">
						<input type="checkbox" class="allCheck" />
					</th>
					<th>
						<a href="#" class="sort" name="username" hidefocus>学号</a>
					</th>
					<th>
						<a href="#" class="sort" name="email" hidefocus>学生姓名</a>
					</th>
					<th>
						<a href="#" class="sort" name="name" hidefocus>家长姓名</a>
					</th>
					<th>
						<a href="#" class="sort" name="loginDate" hidefocus>家长手机号码</a>
					</th>
				</tr>
				<div>
				
				<#list pager.result as admin>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="" />
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</#list>
				</table>
				<div >
					<SELECT id="smsTemplete">
					<OPTION selected value="--请选择短信模版--">--请选择短信模版--</OPTION>
					<OPTION  value="家庭教育 - 督促学习">家庭教育 - 督促学习</OPTION>
					<OPTION  value="家庭教育 - 鼓励进步">家庭教育 - 鼓励进步</OPTION>
					<OPTION  value="家庭教育 - 鼓励创新">家庭教育 - 鼓励创新</OPTION>
					<OPTION  value="家庭教育 - 教育处世">家庭教育 - 教育处世</OPTION>
					<OPTION  value="系统消息 - 开学通知">系统消息 - 开学通知</OPTION>
					<OPTION  value="健康园地 - 关心健康">健康园地 - 关心健康</OPTION>
					</SELECT>
					
					<TEXTAREA id=u149  class="u149"    >输入文本...</TEXTAREA>
					
					<div id="u150" class="u150"  >
					<div id="u150_rtf"><p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">字数：12/120字</span></p></div>
			</div>
				
		</form>
		
		
		
	</div>
</body>
</html>