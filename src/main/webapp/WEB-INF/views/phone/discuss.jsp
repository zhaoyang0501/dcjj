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
				<div class="buttons-tab">
					<a href="#tab1" class="tab-link active  button">医院评价</a>
					 <a href="#tab2" class="tab-link  button">医生评价</a>
				</div>
				<div class="content-block" style="padding: 0px; margin: 0px">
					<div class="tabs">
						<div id="tab1" class="card tab active " style="padding: 0px; margin: 0px">
						<div class="content-block" style="padding: 0px; margin: 0px">

								<div class="list-block media-list" style="padding: 0px; margin: 0px">
									<ul>
									<c:forEach items="${lists1}" var="bean">
										<li>
												<div class="item-content">
													<div class="item-media">
														<img src="../img/user.png" style='width: 2.2rem;'>
													</div>
													<div class="item-inner">
														<div class="item-title-row" style="color: #ff9600">${bean.user.name }     ${bean.user.tel }</div>
														<p>${bean.remark }  </p>
														<div style="float: right">${bean.createDate }</div>
													</div>
												</div>
											</li>
									</c:forEach>
									
										
											
										  <li>
											<form action="discussadd" method="post">
											<input name="type" type="hidden" value="1"/>
												<div class="item-content">
													<div class="item-inner">
														<div class="item-title label">发表评论</div>
														<div class="item-input">
															<input name='remark' type="text" placeholder="谈一些你对医院的看法吧">
														</div>
														<button type="submit" class="button  button-fill button-success">提交</button>
													</div>
												</div>
											</form>
										</li>

									</ul>
								</div>
							</div>
						</div>

						<div id="tab2" class="tab " style="padding: 0px; margin: 0px">
							<div class="content-block" style="padding: 0px; margin: 0px">

								<div class="list-block media-list" style="padding: 0px; margin: 0px">
									<ul>
									<c:forEach items="${lists2}" var="bean">
										<li>
												<div class="item-content">
													<div class="item-media">
														<img src="../img/user.png" style='width: 2.2rem;'>
													</div>
													<div class="item-inner">
														<div class="item-title-row" style="color: #ff9600">${bean.user.name }     ${bean.user.tel }</div>
														<p>${bean.remark }  </p>
														<div style="float: right">${bean.createDate }</div>
													</div>
												</div>
											</li>
									</c:forEach>
									
										
											
										  <li>
											<form action="discussadd" method="post">
											<input name="type" type="hidden" value="2"/>
												<div class="item-content">
													<div class="item-inner">
														<div class="item-title label">发表评论</div>
														<div class="item-input">
															<input name='remark' type="text" placeholder="谈一些你的看法吧">
														</div>
														<button type="submit" class="button  button-fill button-success">提交</button>
													</div>
												</div>
											</form>
										</li>

									</ul>
								</div>
							</div>
						</div>

					</div>
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
