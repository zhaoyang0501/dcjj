<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        color:yellow;
      }
       .custom-score {
        font-size: 1.5em;
        color:red;
      }
    </style>
  </head>
  <body>

  <div class="page-group">
      <!-- 你的html代码 -->
      <div class="page">
           <%@include file="./header.jsp" %>
       <div class="content"> 
       
       <div class="buttons-tab">
    <a href="#tab1" class="tab-link  button">电影</a>
    <a href="#tab2" class="tab-link active button">评论</a>
  </div>
  <div class="content-block" style="padding: 0px ;margin: 0px">
    <div class="tabs">
       		 <div  id="tab1" class="card tab "  style="padding: 0px ;margin: 0px">
			   <div class="card-header no-border">
			      <div class="facebook-avatar"><img src="${project.img }" width="54" height="54"></div>
			      <div class="facebook-name">${project.name }</div>
			      <div class="facebook-date" style="color: red">
			           	评分： <input name='score' value="${project.score }"  data-readonly type="hidden" class="rating-tooltip-manual" data-filled="fa fa-star fa-3x custom-score" data-empty="fa fa-star-o fa-3x custom-score" data-fractions="3"/>
			      </div>
			    </div>
			    
			    <div class="card-header">${project.title1 }</div>
			    <div class="card-content">
			      <div class="card-content-inner"><h5 > 发剧情介绍：</h5>
			      ${project.title3 }
						
						<h5 > 发行公司：</h5> ${project.title4 }
						<h5 >演员：</h5> ${project.title5 }
						</div>
			    </div>
			    <div class="card-footer"></div>
			  </div>
		     
		      <div id="tab2" class="tab active" style="padding: 0px ;margin: 0px">
		        <div class="content-block" style="padding: 0px ;margin: 0px">
		           
		            <div class="list-block media-list" style="padding: 0px ;margin: 0px">
				    <ul>
				    
				    <c:forEach  items="${msgs }" var="bean">
				    
				      <li>
				        <div class="item-content">
				          <div class="item-media"><img src="http://gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i3/TB10LfcHFXXXXXKXpXXXXXXXXXX_!!0-item_pic.jpg_250x250q60.jpg" style='width: 2.2rem;'></div>
				          <div class="item-inner">
				            <div class="item-title-row" style="color: #ff9600">
				          		  ${bean.user.username }  发表于${bean.createDate }
				            </div>
				            <div>${bean.remark }</div>
				          </div>
				        </div>
				      </li>
				    </c:forEach>
				    
				     
				      
				       <li>
				       <form action="msgadd" method="post">
				    	<input  type="hidden" name="project.id" value="${project.id }"/>
				        <div class="item-content">
				          <div class="item-inner">
				            <div class="item-title label">发表评论</div>
				            <div class="item-input">
				              <input name='remark' type="text" placeholder="谈一些你的看法吧">
				            </div>
				            <div class="item-input">
				             <input name='score' type="hidden" class="rating-tooltip-manual" data-filled="fa fa-star fa-3x custom-heart" data-empty="fa fa-star-o fa-3x custom-heart" data-fractions="3"/>
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
      
      
      <div id="tab3" class="tab">
        <div class="content-block">
          <p>This is tab 3 content</p>
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
    	  jQuery('.rating-tooltip-manual').rating();
    	  jQuery('.rating').rating();
    	});
    </script>
  </body>
</html>
