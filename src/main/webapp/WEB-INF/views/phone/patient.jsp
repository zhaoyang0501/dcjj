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
			
			<c:forEach items="${lists }" var="bean">
			 <div class="content-block-title">${bean.name }</div>
				 <div class="list-block media-list">
					    <ul>
					      <li>
					        <a href="viewpatient?id=${bean.id }" class="item-link item-content">
					          <div class="item-media"><img src="../img/user.png" style='width: 4rem;'></div>
					          <div class="item-inner">
					            <div class="item-title-row">
					              <div class="item-title">${bean.name }：${bean.type }</div>
					              <div class="item-after">${bean.gotimes }</div>
					            </div>
					            <div class="item-subtitle">主诉：</div>
					            <div class="item-text">${bean.remark }</div>
					          </div>
					        </a>
					      </li>
					    </ul>
					  </div>
			</c:forEach>
			
			
				 
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
