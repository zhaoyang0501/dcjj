<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <header class="bar bar-nav">
              <a class="button button-link button-nav pull-left" href="javascript:void(0)"  onclick="history.back()">
                  <span class="icon icon-left"></span>
               	   返回
              </a>
              <h1 class="title">医患交流平台</h1>
          </header>
          <nav class="bar bar-tab">
              <a class="tab-item external " href="chart">
                  <span class="icon icon-phone"></span>
                  <span class="tab-label">医患交流</span>
              </a>
               <a class="tab-item external" href="discuss">
                  <span class="icon icon-star"></span>
                  <span class="tab-label">就医评价</span>
              </a>
              <a class="tab-item external" href="patient">
                  <span class="icon icon-friends"></span>
                  <span class="tab-label">我的患者</span>
              </a>
              <a class="tab-item external" href="center">
                  <span class="icon icon-me"></span>
                  <span class="tab-label">个人中心</span>
              </a>
          </nav>