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
	
	<!-- <script type="text/javascript" src="<%=path %>/js/lunbo.js"></script>  -->
	
	<style rel="stylesheet" type="text/css">
		.c1-bline{border-bottom:#464547 1px dashed;border-top:1px;} 
		.f-right{float:right}
		.f-left{float:left}
		.clear{clear:both}
		
		*{margin:0;padding:0;list-style:none;}
		
		.wrap{height:250px;
			 width:900px;
			 overflow: hidden;
			 position: relative;
			 }
		.wrap ul{position:absolute;} 
		.wrap ul li{height:170px;}
		.wrap ol{position:absolute;
				 right:5px;
				 bottom:10px;}
		.wrap ol li{height:20px; width: 20px;
				 background:#ccc;
				 border:solid 1px #666;
				 margin-left:5px;
				 color:#000;
				 float:left;
				 line-height:center;
				 text-align:center;
				 cursor:pointer;}
		.wrap ol .on{background:#104E8B;
		 			color:#fff;}
	</style>

    <script type="text/javascript">
    window.onload=function(){
    	 var wrap=document.getElementById('wrap'),
    	 pic=document.getElementById('pic').getElementsByTagName("li"),
    	 list=document.getElementById('list').getElementsByTagName('li'),
    	 index=0,
    	 timer=null;
    	 
    	 // 定义并调用自动播放函数
    	 timer = setInterval(autoPlay, 2000);
    	 
    	 // 鼠标划过整个容器时停止自动播放
    	 wrap.onmouseover = function () {
    	 clearInterval(timer);
    	 }
    	 
    	 // 鼠标离开整个容器时继续播放至下一张
    	 wrap.onmouseout = function () {
    	 timer = setInterval(autoPlay, 2000);
    	 }
    	 // 遍历所有数字导航实现划过切换至对应的图片
    	 for (var i = 0; i < list.length; i++) {
    	 list[i].onmouseover = function () {
    	 clearInterval(timer);
    	 index = this.innerText - 1;
    	 changePic(index);
    	 };
    	 };
    	 
    	 function autoPlay () {
    	 if (++index >= pic.length) index = 0;
    	 changePic(index);
    	 }
    	 
    	 // 定义图片切换函数
    	 function changePic (curIndex) {
    	 for (var i = 0; i < pic.length; ++i) {
    	 pic[i].style.display = "none";
    	 list[i].className = "";
    	 }
    	 pic[curIndex].style.display = "block";
    	 list[curIndex].className = "on";
    	 }
    	 
    	 };
    	 
    </script>
</head>
  

<body>


<jsp:include flush="true" page="/qiantai/top.jsp"></jsp:include>



<div class="con_sy">
	<table border="0">
	    <tr>
	        <td align="left" valign="top">
				 
				 
					<!--<img src="/zxwz/images/index.jpg" width="900" height="300"/>  -->
					<div class="wrap" id='wrap' style="width:900px;margin-top: 1px;">
						 <ul id="pic">
							 <li><img src="/zxwz/images/index.jpg" width="900" height="300" alt=""></li>
							 <li><img src="/zxwz/images/index2.jpg" width="900" height="300" alt=""></li>
							 <li><img src="/zxwz/images/index3.jpg" width="900" height="300" alt=""></li>
							 <li><img src="/zxwz/images/index4.jpg" width="900" height="300" alt=""></li>
						 </ul>
						 <ol id="list">
							 <li class="on">1</li>
							 <li>2</li>
							 <li>3</li>
							 <li>4</li>
						 </ol>
					 </div>
					
				
				 <div style="width:900px;margin-top: 10px;">
				      <div style="height:24px;background:url(<%=path %>/images/yiyuanjieshao.jpg);">
				         <span style="float:left;font-family: 微软雅黑;font-size: 12px;margin-top: 3px;margin-left: 10px;color:#FFFFFF">医院介绍</span>
				      </div>
				      <div style="height: 100%;border:1px solid #104E8B;border-top: white;">
				          <div style="padding-top: 5px;padding-left: 5px;padding-right: 5px;line-height: 170%">
				                <c:out value="${sessionScope.jieshao.content }" escapeXml="false"></c:out>
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
