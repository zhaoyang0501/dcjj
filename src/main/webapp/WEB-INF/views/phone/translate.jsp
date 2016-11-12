<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<script type='text/javascript'
	src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js'
	charset='utf-8'></script>
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
</head>
<body>
		<div class="page-group">
			<div class="page">
				<%@include file="./header.jsp"%>

				<div class="content">
					 <form action="dotranslate" method="post">
					<div class="list-block">
						<ul>
							<!-- Text inputs -->
							<li>
								<div class="item-content">
									<div class="item-media">
										<i class="icon icon-form-name"></i>
									</div>
									<div class="item-inner">
										<div class="item-input">
											<input name='key' type="text" placeholder="输入需要翻译的句子或者短语">
										</div>
									</div>
								</div>
							</li>
						</ul>
						  <div class="content-block-title">翻译:<span style="color:blue;"> ${key }   </span></div>
					</div>

					<div class="content-block">
						<p>
							<a href="javascript:void(0)" onclick="fun_submit()"
								class="button button-fill button-success">查询</a>
						</p>
					</div>
					</form>	
						<c:forEach items="${results}" var="bean"   varStatus="status">
						
						<div class="content-block-title">解释${status.index+1}</div>
						  <div class="card">
						    <div class="card-content">
						      <div class="card-content-inner">${bean }</div>
						    </div>
						  </div>
						  
						</c:forEach>
				</div>
				
				
				
				
			</div>
		</div>
		</div>
	<script>
     function fun_submit(){
    	 $("form").submit();
     }
     $(function() {
    	 <c:if test="${tip!=null }">
	 	 $.toast("${tip}");
	  </c:if>
    	  $(".swiper-container").swiper({
    		  pagination: '.swiper-pagination',
    	        paginationClickable: true,
    	        direction: 'vertical'
    	    });
    	});
    </script>
</body>
</html>
