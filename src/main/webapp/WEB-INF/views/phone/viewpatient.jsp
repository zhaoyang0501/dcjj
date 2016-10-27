<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>我的生活</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link href="http://dreyescat.github.io/bootstrap-rating/bower_components/fontawesome/css/font-awesome.css" rel="stylesheet">
<link href="//cdn.bootcss.com/bootstrap-rating/1.3.2/bootstrap-rating.min.css" rel="stylesheet">
<script src="http://dreyescat.github.io/bootstrap-rating/bower_components/jquery/dist/jquery.js"></script>
<script>
  $.noConflict();
  </script>
<script src=" http://dreyescat.github.io/bootstrap-rating/bower_components/bootstrap/js/tooltip.js"></script>
<script src="//cdn.bootcss.com/bootstrap-rating/1.3.2/bootstrap-rating.min.js"></script>

<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>
<link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<style>
.custom-heart {
	font-size: 2.5em;
	color: yellow;
}

.custom-score {
	font-size: 1.5em;
	color: red;
}
</style>
</head>
<body>

	<div class="page-group">
		<!-- 你的html代码 -->
		<div class="page">
			<%@include file="./header.jsp"%>
			<div class="content">
				 <div class="list-block media-list">
					    <ul>
					      <li>
					        <a href="discuss" class="item-link item-content">
					          <div class="item-media"><img src="../img/user.png" style='width: 4rem;'></div>
					          <div class="item-inner">
					            <div class="item-title-row">
					              <div class="item-title"><b>${bean.name }</b>：${bean.level } ${bean.age }岁</div>
					              <div class="item-after" style="color: blue;">病人详细资料</div>
					            </div>
					            <div class="item-subtitle">病状：${bean.remark }</div>
					            <div class="item-text">病历号：${bean.cardid }</div>
					          </div>
					        </a>
					      </li>
					    </ul>
					  </div>
					  
					  
				  <div class="list-block">
				    <ul>
				      <li class="item-content">
				      <div class="item-media"><i class="icon icon icon-clock"></i></div>
				        <div class="item-inner">
				          <div class="item-title">挂号时间</div>
				          <div class="item-after">${bean.createDate }</div>
				        </div>
				      </li>
				      <li class="item-content">
				        <div class="item-media"><i class="icon icon-card"></i></div>
				        <div class="item-inner">
				          <div class="item-title">挂号科室</div>
				          <div class="item-after">${bean.type }</div>
				        </div>
				      </li>
				    </ul>
				  </div>
			
			 <div class="list-block">
			    <ul>
			      <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-edit"></i></div>
			        <div class="item-inner">
			          <div class="item-title">就诊记录</div>
			        </div>
			      </li>
			      <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-emoji"></i></div>
			        <div class="item-inner">
			          <div class="item-title">检验报告</div>
			        </div>
			      </li>
			      
			      <li class="item-content item-link">
			        <div class="item-media"><i class="icon icon-search"></i></div>
			        <div class="item-inner">
			          <div class="item-title">检查报告</div>
			        </div>
			      </li>
			      
			    </ul>
			  </div>
				 
			</div>
		</div>
	</div>
 <script>
     jQuery(function() {
    	  <c:if test="${tip!=null }">
    	 	 $.toast("评论成功");
    	  </c:if>
    	});
    </script>
</body>
</html>
