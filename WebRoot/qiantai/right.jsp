<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
    </style>

    <script type="text/javascript">
    
    </script>
</head>
  

<body>

<div style="width:250px;margin-top: 1px;margin-left: 6px;">
	<div style="height:24px;background:url(<%=path %>/images/yiyuanjieshao.jpg);">
	     <span style="float:left;font-family: 微软雅黑;font-size: 13px;color:#FFFFFF;margin-top: 3px;margin-left: 10px;">联系我们</span>
	</div>
	<div style="height: 100%;border:1px solid #CCCCCC;border-top: white;">
         <div style="padding-top: 6px;padding-left: 6px;">
              <div class="c1-bline" style="margin-top: 6px;">
			       <div class="f-left" style="margin-left: 6px;">
			                                   地址：浙江财经大学
			       </div>
			      <div class="f-right" style="margin-right: 6px;"></div><div class="clear"></div>
			  </div>
			  <div class="c1-bline" style="margin-top: 6px;">
			       <div class="f-left" style="margin-left: 6px;">
			                                  电话：123456789
			       </div>
			      <div class="f-right" style="margin-right: 6px;"></div><div class="clear"></div>
			  </div>
			  <div class="c1-bline" style="margin-top: 6px;">
			       <div class="f-left" style="margin-left: 6px;">
			                                  电子邮箱：jy123@qq.com
			       </div>
			      <div class="f-right" style="margin-right: 6px;"></div><div class="clear"></div>
			  </div>
			  <div class="c1-bline" style="margin-top: 6px;">
			       <div class="f-left" style="margin-left: 6px;">
			                                 
			       </div>
			      <div class="f-right" style="margin-right: 6px;"></div><div class="clear"></div>
			  </div>
			  <br/>
         </div>
	</div>
</div>


<div style="width:250px;margin-top: 1px;margin-left: 6px;margin-top: 8px;">
	<div style="height:24px;background:url(<%=path %>/images/yiyuanjieshao.jpg);">
	     <span style="float:left;font-family: 微软雅黑;font-size: 13px;color:#FFFFFF;margin-top: 3px;margin-left: 10px;">科室介绍</span>
	</div>
	<div style="height: 100%;border:1px solid #CCCCCC;border-top: white;">
         <div style="padding-top: 6px;padding-left: 6px;">
              <c:forEach items="${sessionScope.keList}" var="ke" varStatus="sta">
			  <div class="c1-bline" style="margin-top: 6px;">
			       <div class="f-left" style="margin-left: 6px;">
			            <a href="<%=path %>/yisheng?type=yishengByKe&ke_id=${ke.id}"><img src="<%=path %>/img/dian.jpg"/>${ke.mingcheng }</a>
			       </div>
			      <div class="f-right" style="margin-right: 6px;"></div><div class="clear"></div>
			  </div>
			  </c:forEach>
			  <br/>
         </div>
	</div>
</div>

</body>
</html>
