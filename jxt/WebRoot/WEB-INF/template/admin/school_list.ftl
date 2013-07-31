<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style type="text/css">
  * {
    font-family: "Arial", "宋体";
    font-size: 9pt;
  }
  div.tableContainer {
    border: 1px solid #808080;
    width: 800px;
    height: 300px;
  }
  
  div.tableContainer div.fixedHeaderContainer {
  	/* border: 1px solid red; */
    overflow-x: hidden;
    overflow-y: hidden;
    position: relative;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 24px;
  }
  
   div.tableContainer div.fixedHeaderContainer table {
    width: 100%;
    height: 24px;
  }
  
  tbody.fixedHeader td {
    background: #D4D0C8;
    border-left: 1px solid #FFF;
    border-right: 1px solid #808080;
    border-top: 1px solid #FFF;
    border-bottom: 1px solid #808080;
    font-weight: normal;
    padding: 2px 1px 3px 1px;
    text-align: center;
    clear: left;
  }
  
  div.scrollContentContainer {
  	position: relative;
  	top: 0px;
  	left: 0px;
  	/* border: 1px solid green; */
  	height: 274px;
  	width: 100%;
  	overflow-x: hidden;
  	overflow-y: scroll;
  }
  
  div.scrollContentContainer table.scrollContent td {
  	background: #FFF;
    border-bottom: none;
    border-left: none;
    border-right: 1px solid #CCC;
    border-top: 1px solid #DDD;
    padding: 2px 1px 3px 1px;
    clear: left;
  }
</style>
<title>家校通管理平台</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>

<body>
<form id="listForm" action="admin!list.action" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="${base}/template/admin/images/mail_leftbg.gif"><img src="${base}/template/admin/images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="${base}/template/admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">学校管理</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="${base}/template/admin/images/mail_rightbg.gif"><img src="${base}/template/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="${base}/template/admin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
		    <table width="80%" align="center">
				<tr>
					<td width="80%" colspan="2" height="188" align="center">
						<div id="tableContainer" class="tableContainer" style="width:800px">
							<div id="fixedHeaderContainer" class="fixedHeaderContainer">
								<table cellspacing="0" cellpadding="0">
									<tbody class="fixedHeader">
										<tr>
										  <td width="100">学校名称</td>
								          <td width="200">所属代理商</td>
								          <td width="100">行政区域</td>
								          <td width="100">联系方式</td>
								          <td width="100">操作</td>
							            </tr>
									</tbody>
								</table>
							</div>
							<div id="scrollContentContainer" class="scrollContentContainer">
								<table class="scrollContent" cellspacing="0" cellpadding="0" width="784">
									<tbody>
										<#list pager.result as school>
										<tr>
											<td width="100">${(school.name)!}</td>
											<td width="200">${(school.agent.name)!}</td>
											<td width="100">${(school.city.name)!}-${(school.district.name)!}</td>
											<td width="100">${(school.description)!}</td>
											<td width="84">
												<a href="school!edit.action?id=" title="修改">[修改]</a>&nbsp;&nbsp;
												<a href="school!edit.action?id=" title="取消">[取消]</a>
											</td>
										</tr>
			    						</#list> 
									    </tbody>
								</table>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td align="center" class="left_txt" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td align="center" class="left_txt" colspan="2">
						<input type="button" onclick="location.href='school!add.action'" value="添加学校">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="重置">
					</td>
				</tr>

			</table>
		</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td background="${base}/template/admin/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="${base}/template/admin/images/mail_leftbg.gif"><img src="${base}/template/admin/images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="${base}/template/admin/images/buttom_bgs.gif"><img src="${base}/template/admin/images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="${base}/template/admin/images/mail_rightbg.gif"><img src="${base}/template/admin/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>

</html>
