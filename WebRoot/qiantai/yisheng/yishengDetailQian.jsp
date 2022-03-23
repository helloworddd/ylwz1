<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %> 

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#999 1px dashed;border-top:1px;} 
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
	</style>

    <script type="text/javascript">
            
            function liuyanAdd(yisheng_id)
            {
                <c:if test="${sessionScope.userType!=1}">
	                  alert("请先登录");
	                  return false;
	            </c:if>
	            
	            var url="<%=path %>/qiantai/liuyan/liuyanAdd.jsp?yisheng_id="+yisheng_id;
	            window.location.href=url;
	            
            }
    </script>
    
    
</head>
  

<body>


<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>





<div class="con_sy">
	<table border="0">
	    <tr>
	        <td align="left" valign="top">
	            <div style="width:900px;margin-top: 1px;">
				      <div style="height: 100%;border:0px solid #CCCCCC;">
				          <div style="padding-top: 5px;padding-left: 5px;padding-right: 5px;">
				                <TABLE class=main border=0 cellSpacing=0 cellPadding=0 height=115 style="margin-top: 10px;margin-left: 10px;">
					              <TR>
					                  <td align="left" valign="top">
					                      <fieldset style="width:160px; height: 200px;border: 2px;"><legend class="fieldtitle">照片</legend>
												<table class="bill" width="99%">
												    <tr>
												        <td><IMG border=0 align=absMiddle src="<%=path %>/${requestScope.yisheng.fujian}" width=155 height=176></td>
												    </tr>
												</table>
										  </fieldset>
					                  </td>
					                  <td></td>
					                  <td align="left" valign="top">
					                      <fieldset style="width:700px; margin-left:5px;height: 100%;border: 2px;"><legend class="fieldtitle">个人信息</legend>
												<table class="bill" width="99%" cellspacing="12">
												    <tr>
												        <td>姓名：${requestScope.yisheng.xingming}</td>
												    </tr>
												    <tr>
												        <td>性别：${requestScope.yisheng.xingbie}</td>
												    </tr>
												    <tr>
												        <td>年龄：${requestScope.yisheng.nianling}</td>
												    </tr>
												    <tr>
												        <td>科室：${requestScope.yisheng.ke.mingcheng}</td>
												    </tr>
												    <tr>
												        <td>擅长：${requestScope.yisheng.shanchang}</td>
												    </tr>
												    <tr>
												        <td>类型：${requestScope.yisheng.leixing}</td>
												    </tr>
												    <tr>
												        <td>
												            <input type="button" value="留言咨询" style="width: 80px;" onclick="liuyanAdd(${requestScope.yisheng.id})"/>&nbsp; 
												        </td>
												    </tr>
												</table>
										  </fieldset>
					                  </td>
					              </TR>
				              </TABLE>
				          </div>
				      </div>
				 </div>
				 
	        </td>
	        <td align="left" valign="top">
		        <jsp:include flush="true" page="/qiantai/right.jsp"></jsp:include>
	        </td>
	    </tr>
	</table>
</div>












<jsp:include flush="true" page="/qiantai/down.jsp"></jsp:include>




</body>
</html>
