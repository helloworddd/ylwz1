<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function yishengDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yisheng?type=yishengDel&id="+id;
               }
           }
          
           function yishengAdd()
           {
                 var url="<%=path %>/admin/yisheng/yishengAdd.jsp";
				 window.location.href=url;
           }
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="110" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="4%">序号</td>
					<td width="10%">姓名</td>
					<td width="10%">性别</td>
					<td width="10%">年龄</td>
					
					<td width="10%">科室</td>
					<td width="20%">擅长</td>
					<td width="10%">照片</td>
					<td width="10%">类型</td>
					
					<td width="10%">账号</td>
					<td width="8%">密码</td>
					<td width="6%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yishengList}" var="yisheng" varStatus="ss">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td  bgcolor="#FFFFFF" align="center">
						${ss.index+1}
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						${yisheng.xingming}
					</td>
					<td  bgcolor="#FFFFFF" align="center">
					    ${yisheng.xingbie}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.nianling}
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.ke.mingcheng}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.shanchang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <div onmouseover = "over('<%=path %>/${yisheng.fujian}')" onmouseout = "out()" style="cursor:hand;">
							照片
					    </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.leixing}
					</td>
					
					
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.loginname}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yisheng.loginpw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="yishengDel(${yisheng.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 11px;">
			  <tr>
			    <td>
			      <input type="button" value="添加医生" style="width: 123px;" onclick="yishengAdd()" />
			    </td>
			  </tr>
		    </table>
		    
		    <div id="tip" style="position:absolute;display:none;border:0px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="150" width="130"></TD>
				</TR>
			</TABLE>
		    </div>
	</body>
</html>
