<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" />
<link rel='stylesheet prefetch' href='//codepen.io/assets/reset/reset.css'><script src='//codepen.io/assets/libs/prefixfree.min.js'></script>
<style class="cp-pen-styles">* {
  box-sizing: border-box;
}
body {
  background: #FFF;
  font-family: Roboto, sans-serif;
  font-weight: 400;
  line-height: 1.5em;
  color: #888;
}
h1 {
  font-size: 50px;
  line-height: 40px;
  font-weight: 100;
}
p {
  margin-bottom: 1em;
}
a {
  color: #61c7b3;
  text-decoration: none;
  transition-duration: .3s;
}
a:hover {
  color: #338f7d;
  transition-duration: .05s;
  text-decoration: none;
}
.circle-icon {
  width: 30px;
  height: 30px;
  text-align: center;
  line-height: 28px;
  border: 2px solid #B4BBC1;
  border-radius: 100px;
  font-size: 14px;
  color: #B4BBC1;
  cursor: pointer;
  display: block;
  float: left;
}
.circle-icon.small {
  height: 25px;
  width: 25px;
  line-height: 23px;
  font-size: 11px;
}
.circle-icon:hover {
  color: #57636C;
  border-color: #57636C;
}
.circle-icon.red {
  color: #d23b3d;
  border-color: #d23b3d;
}
.circle-icon.red:hover {
  color: #791C1E;
  border-color: #791C1E;
}
#sidebar {
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 300px;
  background: #1d2127;
  transition-duration: .3s;
  z-index: 5;
}
#sidebar,
#sidebar a {
  color: #abb4be;
}
#sidebar .logo-container {
  font-weight: 100;
  font-size: 50px;
  line-height: 40px;
  text-align: center;
  margin: 50px 0;
  cursor: pointer;
}
#sidebar .logo-container .logo {
  position: relative;
  top: -6px;
  font-size: 25px;
  margin-right: 15px;
  padding: 10px;
  border: 2px solid #61c7b3;
  border-radius: 100px;
  text-indent: 1px;
  color: #61c7b3;
}
#sidebar .compose-button {
  border-radius: 100px;
  padding: 13px 20px;
  text-align: center;
  font-weight: 500;
  text-transform: uppercase;
  color: #61c7b3;
  border: 2px solid #61c7b3;
  display: block;
  margin: 0 50px 30px 50px;
  cursor: pointer;
}
#sidebar .compose-button:hover {
  color: #abb4be;
  border-color: #abb4be;
}
#sidebar .menu-segment {
  padding: 0 50px 0 70px;
}
#sidebar .menu-segment ul,
#sidebar .menu-segment li {
  margin: 0;
  padding: 0;
}
#sidebar .menu-segment .ball.pink {
  border-color: #EA4C89;
}
#sidebar .menu-segment .ball.green {
  border-color: #9AE14F;
}
#sidebar .menu-segment .ball.blue {
  border-color: #1BC3E1;
}
#sidebar .menu-segment li.title {
  text-transform: uppercase;
  font-weight: 600;
  padding: 10px 0;
  color: #465162;
}
#sidebar .menu-segment li.title .icon {
  float: right;
}
#sidebar .menu-segment li.active a,
#sidebar .menu-segment li.active a:hover {
  background: #282d36;
}
#sidebar .menu-segment li a {
  display: block;
  margin: 0 -50px 0 -70px;
  padding: 10px 50px 10px 70px;
}
#sidebar .menu-segment li a:hover {
  background: #21262d;
}
#sidebar .menu-segment li .italic-link {
  margin-left: -30px;
  font-style: italic;
  color: #465162;
}
#sidebar .menu-segment li .italic-link,
#sidebar .menu-segment li .italic-link:hover {
  background: transparent;
}
#sidebar .menu-segment li .italic-link:hover {
  color: #abb4be;
}
#sidebar .menu-segment .labels li a span,
#sidebar .menu-segment .chat li a span {
  display: block;
  border: 5px solid red;
  border-radius: 100px;
  margin-top: 6px;
}
#sidebar .menu-segment .labels.labels li a span,
#sidebar .menu-segment .chat.labels li a span {
  float: right;
}
#sidebar .menu-segment .labels.chat li a span,
#sidebar .menu-segment .chat.chat li a span {
  float: left;
  margin-right: 10px;
}
#sidebar .menu-segment .chat li a {
  padding-left: 50px;
}
#sidebar .separator {
  margin: 30px 35px;
  height: 1px;
  background: #2D3138;
}
#sidebar .bottom-padding {
  height: 100px;
}
#sidebar > .nano-pane {
  background: transparent;
}
#sidebar > .nano-pane .nano-slider {
  background: rgba(255, 255, 255, 0.1);
}
#main {
  position: fixed;
  top: 0;
  left: 300px;
  bottom: 0;
  right: 0;
  z-index: 4;
  transition-duration: .3s;
  padding-left: 4px;
  box-shadow: inset 4px 0 0 #efefef, inset 5px 0 0 #e2e2e2;
}
#main .overlay {
  position: absolute;
  top: 0;
  left: -10px;
  right: 0;
  bottom: 100%;
  background: rgba(0, 0, 0, 0.4);
  z-index: 5;
  opacity: 0;
  transition-duration: 0s;
  transition-property: opacity;
}
.show-main-overlay #main .overlay {
  opacity: 1;
  bottom: 0;
  transition-duration: .5s;
}
#main .header {
  padding: 50px 60px;
  border-bottom: 1px solid #efefef;
  overflow: hidden;
}
#main .header .page-title {
  display: block;
}
#main .header .page-title .sidebar-toggle-btn {
  width: 0;
  margin-top: 1px;
  padding: 11px 0 0 0;
  float: left;
  position: relative;
  display: block;
  cursor: pointer;
  transition-duration: .3s;
  transition-delay: .5s;
  opacity: 0;
  margin-right: 0;
}
.show-sidebar #main .header .page-title .sidebar-toggle-btn {
  transition-delay: 0s;
}
#main .header .page-title .sidebar-toggle-btn .line {
  height: 3px;
  display: block;
  background: #888888;
  margin-bottom: 4px;
  transition-duration: .5s;
  transition-delay: .5s;
}
.show-sidebar #main .header .page-title .sidebar-toggle-btn .line-angle1 {
  transform: rotate(-120deg);
}
.show-sidebar #main .header .page-title .sidebar-toggle-btn .line-angle2 {
  transform: rotate(120deg);
}
#main .header .page-title .sidebar-toggle-btn .line-angle1 {
  width: 8px;
  margin: 0;
  position: absolute;
  top: 15px;
  left: -11px;
  transform: rotate(-60deg);
}
#main .header .page-title .sidebar-toggle-btn .line-angle2 {
  width: 8px;
  margin: 0;
  position: absolute;
  top: 21px;
  left: -11px;
  transform: rotate(60deg);
}
#main .header .page-title .icon {
  font-size: 15px;
  margin-left: 20px;
  position: relative;
  top: -5px;
  cursor: pointer;
}
#main .header .search-box {
  float: right;
  width: 150px;
  height: 40px;
  position: relative;
}
#main .header .search-box input,
#main .header .search-box .icon {
  transition-duration: .3s;
}
#main .header .search-box input {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  border: 0;
  padding: 0;
  margin: 0;
  text-indent: 15px;
  height: 40px;
  z-index: 2;
  outline: none;
  color: #999;
  background: transparent;
  border: 2px solid #efefef;
  border-radius: 5px;
  transition-timing-function: cubic-bezier(0.3, 1.5, 0.6, 1);
}
#main .header .search-box input:focus {
  color: #333;
  border-color: #d6d6d6;
  width: 150%;
}
#main .header .search-box input:focus ~ .icon {
  opacity: 1;
  z-index: 3;
  color: #61c7b3;
}
#main .header .search-box .icon {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  width: 40px;
  text-align: center;
  line-height: 40px;
  z-index: 1;
  cursor: pointer;
  opacity: .5;
}
#main .action-bar {
  padding: 20px 60px;
  border-bottom: 1px solid #efefef;
  overflow: hidden;
}
#main .action-bar li {
  float: left;
  margin-right: 10px;
}
#main #main-nano-wrapper {
  position: absolute;
  top: 214px;
  bottom: 0;
  height: auto;
}
#main .message-list {
  display: block;
}
#main .message-list li {
  position: relative;
  display: block;
  height: 50px;
  line-height: 50px;
  cursor: default;
  transition-duration: .3s;
  /*
			.col-1 {
				width: 140px;
				text-align: right;
				padding-right: 37px;
				padding-top: 15px;

				.checkbox-wrapper, .icon, .dot {
					float: right;
					display: block;
				}

				.icon {
					margin-left: 10px;
					font-size: 20px;
				}

				.dot {
					border: 5px solid transparent;
					border-radius: 100px;
					margin-right: 24px;
					margin-top: 5px;
				}
			}
			.col-2 {
				width: 270px;
			}
			.col-3 {
				position: absolute;
				top: 0;
				left: 390px; // Covers previous cols
				right: 120px;

				.grey {
					opacity: .7;
				}
			}
			.col-4 {
				width: 120px;
				padding-left: 20px;
				float: right;
			}
			*/
}
#main .message-list li:hover,
#main .message-list li.active,
#main .message-list li.selected {
  background: #efefef;
  transition-duration: .05s;
}
#main .message-list li.active,
#main .message-list li.active:hover {
  box-shadow: inset 5px 0 0 #61c7b3;
}
#main .message-list li.unread {
  font-weight: 600;
  color: #555;
}
#main .message-list li .col {
  float: left;
  position: relative;
}
#main .message-list li.blue-dot .col-1 .dot {
  border-color: #1bc3e1;
}
#main .message-list li.orange-dot .col-1 .dot {
  border-color: #e2a917;
}
#main .message-list li.green-dot .col-1 .dot {
  border-color: #9ae14f;
}
#main .message-list li .col-1 {
  width: 400px;
}
#main .message-list li .col-1 .star-toggle,
#main .message-list li .col-1 .checkbox-wrapper,
#main .message-list li .col-1 .dot {
  display: block;
  float: left;
}
#main .message-list li .col-1 .dot {
  border: 4px solid transparent;
  border-radius: 100px;
  margin: 22px 26px 0;
  height: 0;
  width: 0;
  line-height: 0;
  font-size: 0;
}
#main .message-list li .col-1 .checkbox-wrapper {
  margin-top: 15px;
  margin-right: 10px;
}
#main .message-list li .col-1 .star-toggle {
  margin-top: 15px;
}
#main .message-list li .col-1 .title {
  position: absolute;
  top: 0;
  left: 140px;
  right: 0;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
#main .message-list li .col-2 {
  position: absolute;
  top: 0;
  left: 400px;
  right: 0;
  bottom: 0;
}
#main .message-list li .col-2 .subject,
#main .message-list li .col-2 .date {
  position: absolute;
  top: 0;
}
#main .message-list li .col-2 .subject {
  left: 0;
  right: 200px;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
#main .message-list li .col-2 .date {
  right: 0;
  width: 200px;
  padding-left: 80px;
}
#main .load-more-link {
  display: block;
  text-align: center;
  margin: 30px 0 100px 0;
}
#message {
  position: fixed;
  top: 0;
  left: 60%;
  bottom: 0;
  width: 40%;
  z-index: 5;
  transform: translateX(200%);
  transition-duration: .5s;
  padding: 50px 30px;
  background: #efefef;
}
.show-message #message {
  transition-duration: .3s;
}
#message .header {
  margin-bottom: 30px;
  padding: 0;
}
#message .header .page-title {
  display: block;
  float: none;
  margin-bottom: 20px;
}
#message .header .page-title .icon {
  margin-top: 4px;
  margin-right: 10px;
}
#message .header .grey {
  margin-left: 10px;
  color: #999;
}
#message #message-nano-wrapper {
  position: absolute;
  top: 165px;
  bottom: 0;
  height: auto;
  left: 0;
  right: 0;
  width: auto;
}
#message .message-container {
  padding: 0 30px;
}
#message .message-container li {
  padding: 25px;
  border: 1px solid rgba(0, 0, 0, 0.15);
  background: #FFF;
  margin: 0 0 30px 0;
  position: relative;
}
#message .message-container li:hover .details .left .arrow {
  background: #61c7b3;
  border: 0px solid #61c7b3;
}
#message .message-container li:hover .details .left .arrow.orange {
  background: #e2a917;
  border: 0px solid #e2a917;
}
#message .message-container li .details {
  padding-bottom: 20px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  margin-bottom: 30px;
  overflow: hidden;
}
#message .message-container li .details .left {
  float: left;
  font-weight: 600;
  color: #888888;
  transition-duration: .3s;
}
#message .message-container li .details .left .arrow {
  display: inline-block;
  position: relative;
  height: 2px;
  width: 20px;
  background: rgba(0, 0, 0, 0.15);
  vertical-align: top;
  margin-top: 12px;
  margin: 12px 20px 0 15px;
  border: 0px solid rgba(0, 0, 0, 0.15);
  transition-duration: .3s;
}
#message .message-container li .details .left .arrow:after {
  position: absolute;
  top: -4px;
  left: 100%;
  height: 0;
  width: 0;
  border: inherit;
  border-width: 7px;
  border-style: solid;
  content: '';
  border-right: 0;
  border-top-color: transparent;
  border-bottom-color: transparent;
  border-top-width: 5px;
  border-bottom-width: 5px;
}
#message .message-container li .details .right {
  float: right;
  color: #999;
}
#message .message-container li .message {
  margin-bottom: 40px;
}
#message .message-container li .message p:last-child {
  margin-bottom: 0;
}
#message .message-container li:hover .tool-box .red-hover {
  color: #d23b3d;
  border-color: #d23b3d;
}
#message .message-container li:hover .tool-box .red-hover:hover {
  color: #791C1E;
  border-color: #791C1E;
}
#message .message-container li .tool-box {
  position: absolute;
  bottom: 0;
  right: 0;
  border: 0px solid #DDDFE1;
  border-top-width: 1px;
  border-left-width: 1px;
  padding: 8px 10px;
  transition-duration: .3s;
}
#message .message-container li .tool-box a {
  margin-right: 10px;
}
#message .message-container li .tool-box a:last-child {
  margin-right: 0;
}
.show-message #message {
  transform: none;
}
.show-message #main {
  margin-right: 40%;
}
@media only screen and (min-width: 1499px) {
  #main .overlay {
    display: none;
  }
}
@media only screen and (max-width: 1500px) {
  .show-message #main {
    margin-right: 0;
  }
  .show-message #message {
    left: 50%;
    width: 50%;
  }
}
@media only screen and (max-width: 1024px) {
  #sidebar {
    transform: translateX(-100%);
  }
  #main {
    left: 0;
    box-shadow: none;
  }
  #main .header .page-title .sidebar-toggle-btn {
    margin-right: 20px;
    opacity: 1;
    width: 20px;
  }
  .show-sidebar #sidebar {
    transform: none;
  }
  .show-sidebar #main {
    transform: translateX(300px);
  }
  .show-message #main {
    margin-right: 0;
  }
  .show-message #message {
    left: 20%;
    width: 80%;
  }
}
@media only screen and (max-width: 600px) {
  #main .header .search-box {
    float: none;
    width: 100%;
    margin-bottom: -110px;
    margin-top: 70px;
  }
  #main .header .search-box input,
  #main .header .search-box input:focus {
    width: 100%;
  }
  #main .header .page-title {
    margin-bottom: 50px;
  }
  #main #main-nano-wrapper {
    position: absolute;
    top: 260px;
    bottom: 0;
    height: auto;
  }
  #main .message-list li .col-1 {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 120px;
    width: auto;
  }
  #main .message-list li .col-2 {
    right: 0;
    left: auto;
    width: 120px;
  }
  #main .message-list li .col-2 .date {
    padding-left: 0;
    position: static;
  }
  #main .message-list li .col-2 .subject {
    display: none;
  }
}
/**
 * Nano scroll stuff
*/
.nano {
  position: relative;
  width: 100%;
  height: 100%;
  overflow: hidden;
}
.nano > .nano-content {
  position: absolute;
  overflow: scroll;
  overflow-x: hidden;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
.nano > .nano-content:focus {
  outline: none;
}
.nano > .nano-content::-webkit-scrollbar {
  visibility: hidden;
}
.has-scrollbar > .nano-content::-webkit-scrollbar {
  visibility: visible;
}
.nano > .nano-pane {
  background: rgba(117, 117, 117, 0.2);
  position: absolute;
  width: 8px;
  right: 8px;
  top: 8px;
  bottom: 8px;
  visibility: hidden\9;
  /* Target only IE7 and IE8 with this hack */
  opacity: .01;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  -webkit-transition: .3s;
  -moz-transition: .3s;
  -o-transition: .3s;
  transition: .3s;
}
.nano > .nano-pane > .nano-slider {
  background: #444;
  background: #C7C7C7;
  position: relative;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -webkit-transition: .3s;
  -moz-transition: .3s;
  -o-transition: .3s;
  transition: .3s;
  -webkit-transition-property: background;
  -moz-transition-property: background;
  -o-transition-property: background;
  transition-property: background;
}
.nano > .nano-pane:hover > .nano-slider,
.nano > .nano-pane.active > .nano-slider {
  background: #A6A6A6;
}
.nano:hover > .nano-pane,
.nano-pane.active,
.nano-pane.flashed {
  visibility: visible\9;
  /* Target only IE7 and IE8 with this hack */
  opacity: 0.99;
}
</style></head><body>
<aside id="sidebar" class="nano">
  <div class="nano-content">
    <div class="logo-container"><span class="logo glyphicon glyphicon-envelope"></span>Mail</div><a class="compose-button">Compose</a>
    <menu class="menu-segment">
      <ul>
        <li class="active"><a href="#">Inbox<span> (43)</span></a></li>
        <li><a href="#">Important</a></li>
        <li><a href="#">Sent</a></li>
        <li><a href="#">Drafts</a></li>
        <li><a href="#">Trash</a></li>
      </ul>
    </menu>
    <div class="separator"></div>
    <div class="menu-segment">
      <ul class="labels">
        <li class="title">Labels <span class="icon">+</span></li>
        <li><a href="#">Dribbble <span class="ball pink"></span></a></li>
        <li><a href="#">Roommates <span class="ball green"></span></a></li>
        <li><a href="#">Bills <span class="ball blue"></span></a></li>
      </ul>
    </div>
    <div class="separator"></div>
    <div class="menu-segment">
      <ul class="chat">
        <li class="title">Chat <span class="icon">+</span></li>
        <li><a href="#"><span class="ball green"></span>Laura Turner</a></li>
        <li><a href="#"><span class="ball green"></span>Kevin Jones</a></li>
        <li><a href="#"><span class="ball blue"></span>John King</a></li>
        <li><a href="#"><span class="ball blue"></span>Jenny Parker</a></li>
        <li><a href="#"><span class="ball blue"></span>Paul Green</a></li>
        <li><a href="#" class="italic-link">See offline list</a></li>
      </ul>
    </div>
    <div class="bottom-padding"></div>
  </div>
</aside>

<script src='//assets.codepen.io/assets/common/stopExecutionOnTimeout.js?t=1'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>


jQuery(document).ready(function($) {

	var cols = {},

		messageIsOpen = false;

	cols.showOverlay = function() {
		$('body').addClass('show-main-overlay');
	};
	cols.hideOverlay = function() {
		$('body').removeClass('show-main-overlay');
	};


	cols.showMessage = function() {
		$('body').addClass('show-message');
		messageIsOpen = true;
	};
	cols.hideMessage = function() {
		$('body').removeClass('show-message');
		$('#main .message-list li').removeClass('active');
		messageIsOpen = false;
	};


	cols.showSidebar = function() {
		$('body').addClass('show-sidebar');
	};
	cols.hideSidebar = function() {
		$('body').removeClass('show-sidebar');
	};


	// Show sidebar when trigger is clicked

	$('.trigger-toggle-sidebar').on('click', function() {
		cols.showSidebar();
		cols.showOverlay();
	});


	$('.trigger-message-close').on('click', function() {
		cols.hideMessage();
		cols.hideOverlay();
	});


	// When you click on a message, show it

	$('#main .message-list li').on('click', function(e) {
		var item = $(this),
			target = $(e.target);

		if(target.is('label')) {
			item.toggleClass('selected');
		} else {
			if(messageIsOpen && item.is('.active')) {
				cols.hideMessage();
				cols.hideOverlay();
			} else {
				if(messageIsOpen) {
					cols.hideMessage();
					item.addClass('active');
					setTimeout(function() {
						cols.showMessage();
					}, 300);
				} else {
					item.addClass('active');
					cols.showMessage();
				}
				cols.showOverlay();
			}
		}
	});


	// This will prevent click from triggering twice when clicking checkbox/label

	$('input[type=checkbox]').on('click', function(e) {
		e.stopImmediatePropagation();
	});



	// When you click the overlay, close everything

	$('#main > .overlay').on('click', function() {
		cols.hideOverlay();
		cols.hideMessage();
		cols.hideSidebar();
	});



	// Enable sexy scrollbars
	$('.nano').nanoScroller();



	// Disable links

	$('a').on('click', function(e) {
		e.preventDefault();
	});



	// Search box responsive stuff

	$('.search-box input').on('focus', function() {
		if($(window).width() <= 1360) {
			cols.hideMessage();
		}
	});

});




/*! nanoScrollerJS - v0.8.0 - 2014
* http://jamesflorentino.github.com/nanoScrollerJS/
* Copyright (c) 2014 James Florentino; Licensed MIT */
(function($, window, document) {
  "use strict";
  var BROWSER_IS_IE7, BROWSER_SCROLLBAR_WIDTH, DOMSCROLL, DOWN, DRAG, KEYDOWN, KEYUP, MOUSEDOWN, MOUSEMOVE, MOUSEUP, MOUSEWHEEL, NanoScroll, PANEDOWN, RESIZE, SCROLL, SCROLLBAR, TOUCHMOVE, UP, WHEEL, cAF, defaults, getBrowserScrollbarWidth, hasTransform, isFFWithBuggyScrollbar, rAF, transform, _elementStyle, _prefixStyle, _vendor;
  defaults = {

    /**
      a classname for the pane element.
      @property paneClass
      @type String
      @default 'nano-pane'
     */
    paneClass: 'nano-pane',

    /**
      a classname for the slider element.
      @property sliderClass
      @type String
      @default 'nano-slider'
     */
    sliderClass: 'nano-slider',

    /**
      a classname for the content element.
      @property contentClass
      @type String
      @default 'nano-content'
     */
    contentClass: 'nano-content',

    /**
      a setting to enable native scrolling in iOS devices.
      @property iOSNativeScrolling
      @type Boolean
      @default false
     */
    iOSNativeScrolling: false,

    /**
      a setting to prevent the rest of the page being
      scrolled when user scrolls the `.content` element.
      @property preventPageScrolling
      @type Boolean
      @default false
     */
    preventPageScrolling: false,

    /**
      a setting to disable binding to the resize event.
      @property disableResize
      @type Boolean
      @default false
     */
    disableResize: false,

    /**
      a setting to make the scrollbar always visible.
      @property alwaysVisible
      @type Boolean
      @default false
     */
    alwaysVisible: false,

    /**
      a default timeout for the `flash()` method.
      @property flashDelay
      @type Number
      @default 1500
     */
    flashDelay: 1500,

    /**
      a minimum height for the `.slider` element.
      @property sliderMinHeight
      @type Number
      @default 20
     */
    sliderMinHeight: 20,

    /**
      a maximum height for the `.slider` element.
      @property sliderMaxHeight
      @type Number
      @default null
     */
    sliderMaxHeight: null,

    /**
      an alternate document context.
      @property documentContext
      @type Document
      @default null
     */
    documentContext: null,

    /**
      an alternate window context.
      @property windowContext
      @type Window
      @default null
     */
    windowContext: null
  };

  /**
    @property SCROLLBAR
    @type String
    @static
    @final
    @private
   */
  SCROLLBAR = 'scrollbar';

  /**
    @property SCROLL
    @type String
    @static
    @final
    @private
   */
  SCROLL = 'scroll';

  /**
    @property MOUSEDOWN
    @type String
    @final
    @private
   */
  MOUSEDOWN = 'mousedown';

  /**
    @property MOUSEMOVE
    @type String
    @static
    @final
    @private
   */
  MOUSEMOVE = 'mousemove';

  /**
    @property MOUSEWHEEL
    @type String
    @final
    @private
   */
  MOUSEWHEEL = 'mousewheel';

  /**
    @property MOUSEUP
    @type String
    @static
    @final
    @private
   */
  MOUSEUP = 'mouseup';

  /**
    @property RESIZE
    @type String
    @final
    @private
   */
  RESIZE = 'resize';

  /**
    @property DRAG
    @type String
    @static
    @final
    @private
   */
  DRAG = 'drag';

  /**
    @property UP
    @type String
    @static
    @final
    @private
   */
  UP = 'up';

  /**
    @property PANEDOWN
    @type String
    @static
    @final
    @private
   */
  PANEDOWN = 'panedown';

  /**
    @property DOMSCROLL
    @type String
    @static
    @final
    @private
   */
  DOMSCROLL = 'DOMMouseScroll';

  /**
    @property DOWN
    @type String
    @static
    @final
    @private
   */
  DOWN = 'down';

  /**
    @property WHEEL
    @type String
    @static
    @final
    @private
   */
  WHEEL = 'wheel';

  /**
    @property KEYDOWN
    @type String
    @static
    @final
    @private
   */
  KEYDOWN = 'keydown';

  /**
    @property KEYUP
    @type String
    @static
    @final
    @private
   */
  KEYUP = 'keyup';

  /**
    @property TOUCHMOVE
    @type String
    @static
    @final
    @private
   */
  TOUCHMOVE = 'touchmove';

  /**
    @property BROWSER_IS_IE7
    @type Boolean
    @static
    @final
    @private
   */
  BROWSER_IS_IE7 = window.navigator.appName === 'Microsoft Internet Explorer' && /msie 7./i.test(window.navigator.appVersion) && window.ActiveXObject;

  /**
    @property BROWSER_SCROLLBAR_WIDTH
    @type Number
    @static
    @default null
    @private
   */
  BROWSER_SCROLLBAR_WIDTH = null;
  rAF = window.requestAnimationFrame;
  cAF = window.cancelAnimationFrame;
  _elementStyle = document.createElement('div').style;
  _vendor = (function() {
    var i, transform, vendor, vendors, _i, _len;
    vendors = ['t', 'webkitT', 'MozT', 'msT', 'OT'];
    for (i = _i = 0, _len = vendors.length; _i < _len; i = ++_i) {
      vendor = vendors[i];
      transform = vendors[i] + 'ransform';
      if (transform in _elementStyle) {
        return vendors[i].substr(0, vendors[i].length - 1);
      }
    }
    return false;
  })();
  _prefixStyle = function(style) {
    if (_vendor === false) {
      return false;
    }
    if (_vendor === '') {
      return style;
    }
    return _vendor + style.charAt(0).toUpperCase() + style.substr(1);
  };
  transform = _prefixStyle('transform');
  hasTransform = transform !== false;

  /**
    Returns browser's native scrollbar width
    @method getBrowserScrollbarWidth
    @return {Number} the scrollbar width in pixels
    @static
    @private
   */
  getBrowserScrollbarWidth = function() {
    var outer, outerStyle, scrollbarWidth;
    outer = document.createElement('div');
    outerStyle = outer.style;
    outerStyle.position = 'absolute';
    outerStyle.width = '100px';
    outerStyle.height = '100px';
    outerStyle.overflow = SCROLL;
    outerStyle.top = '-9999px';
    document.body.appendChild(outer);
    scrollbarWidth = outer.offsetWidth - outer.clientWidth;
    document.body.removeChild(outer);
    return scrollbarWidth;
  };
  isFFWithBuggyScrollbar = function() {
    var isOSXFF, ua, version;
    ua = window.navigator.userAgent;
    isOSXFF = /(?=.+Mac OS X)(?=.+Firefox)/.test(ua);
    if (!isOSXFF) {
      return false;
    }
    version = /Firefox\/\d{2}\./.exec(ua);
    if (version) {
      version = version[0].replace(/\D+/g, '');
    }
    return isOSXFF && +version > 23;
  };

  /**
    @class NanoScroll
    @param element {HTMLElement|Node} the main element
    @param options {Object} nanoScroller's options
    @constructor
   */
  NanoScroll = (function() {
    function NanoScroll(el, options) {
      this.el = el;
      this.options = options;
      BROWSER_SCROLLBAR_WIDTH || (BROWSER_SCROLLBAR_WIDTH = getBrowserScrollbarWidth());
      this.$el = $(this.el);
      this.doc = $(this.options.documentContext || document);
      this.win = $(this.options.windowContext || window);
      this.$content = this.$el.children("." + options.contentClass);
      this.$content.attr('tabindex', this.options.tabIndex || 0);
      this.content = this.$content[0];
      if (this.options.iOSNativeScrolling && (this.el.style.WebkitOverflowScrolling != null)) {
        this.nativeScrolling();
      } else {
        this.generate();
      }
      this.createEvents();
      this.addEvents();
      this.reset();
    }


    /**
      Prevents the rest of the page being scrolled
      when user scrolls the `.nano-content` element.
      @method preventScrolling
      @param event {Event}
      @param direction {String} Scroll direction (up or down)
      @private
     */

    NanoScroll.prototype.preventScrolling = function(e, direction) {
      if (!this.isActive) {
        return;
      }
      if (e.type === DOMSCROLL) {
        if (direction === DOWN && e.originalEvent.detail > 0 || direction === UP && e.originalEvent.detail < 0) {
          e.preventDefault();
        }
      } else if (e.type === MOUSEWHEEL) {
        if (!e.originalEvent || !e.originalEvent.wheelDelta) {
          return;
        }
        if (direction === DOWN && e.originalEvent.wheelDelta < 0 || direction === UP && e.originalEvent.wheelDelta > 0) {
          e.preventDefault();
        }
      }
    };


    /**
      Enable iOS native scrolling
      @method nativeScrolling
      @private
     */

    NanoScroll.prototype.nativeScrolling = function() {
      this.$content.css({
        WebkitOverflowScrolling: 'touch'
      });
      this.iOSNativeScrolling = true;
      this.isActive = true;
    };


    /**
      Updates those nanoScroller properties that
      are related to current scrollbar position.
      @method updateScrollValues
      @private
     */

    NanoScroll.prototype.updateScrollValues = function() {
      var content;
      content = this.content;
      this.maxScrollTop = content.scrollHeight - content.clientHeight;
      this.prevScrollTop = this.contentScrollTop || 0;
      this.contentScrollTop = content.scrollTop;
      if (!this.iOSNativeScrolling) {
        this.maxSliderTop = this.paneHeight - this.sliderHeight;
        this.sliderTop = this.maxScrollTop === 0 ? 0 : this.contentScrollTop * this.maxSliderTop / this.maxScrollTop;
      }
    };


    /**
      Updates CSS styles for current scroll position.
      Uses CSS 2d transfroms and `window.requestAnimationFrame` if available.
      @method setOnScrollStyles
      @private
     */

    NanoScroll.prototype.setOnScrollStyles = function() {
      var cssValue;
      if (hasTransform) {
        cssValue = {};
        cssValue[transform] = "translate(0, " + this.sliderTop + "px)";
      } else {
        cssValue = {
          top: this.sliderTop
        };
      }
      if (rAF) {
        if (!this.scrollRAF) {
          this.scrollRAF = rAF((function(_this) {
            return function() {
              _this.scrollRAF = null;
              _this.slider.css(cssValue);
            };
          })(this));
        }
      } else {
        this.slider.css(cssValue);
      }
    };


    /**
      Creates event related methods
      @method createEvents
      @private
     */

    NanoScroll.prototype.createEvents = function() {
      this.events = {
        down: (function(_this) {
          return function(e) {
            _this.isBeingDragged = true;
            _this.offsetY = e.pageY - _this.slider.offset().top;
            _this.pane.addClass('active');
            _this.doc.bind(MOUSEMOVE, _this.events[DRAG]).bind(MOUSEUP, _this.events[UP]);
            return false;
          };
        })(this),
        drag: (function(_this) {
          return function(e) {
            _this.sliderY = e.pageY - _this.$el.offset().top - _this.offsetY;
            _this.scroll();
            if (_this.contentScrollTop >= _this.maxScrollTop && _this.prevScrollTop !== _this.maxScrollTop) {
              _this.$el.trigger('scrollend');
            } else if (_this.contentScrollTop === 0 && _this.prevScrollTop !== 0) {
              _this.$el.trigger('scrolltop');
            }
            return false;
          };
        })(this),
        up: (function(_this) {
          return function(e) {
            _this.isBeingDragged = false;
            _this.pane.removeClass('active');
            _this.doc.unbind(MOUSEMOVE, _this.events[DRAG]).unbind(MOUSEUP, _this.events[UP]);
            return false;
          };
        })(this),
        resize: (function(_this) {
          return function(e) {
            _this.reset();
          };
        })(this),
        panedown: (function(_this) {
          return function(e) {
            _this.sliderY = (e.offsetY || e.originalEvent.layerY) - (_this.sliderHeight * 0.5);
            _this.scroll();
            _this.events.down(e);
            return false;
          };
        })(this),
        scroll: (function(_this) {
          return function(e) {
            _this.updateScrollValues();
            if (_this.isBeingDragged) {
              return;
            }
            if (!_this.iOSNativeScrolling) {
              _this.sliderY = _this.sliderTop;
              _this.setOnScrollStyles();
            }
            if (e == null) {
              return;
            }
            if (_this.contentScrollTop >= _this.maxScrollTop) {
              if (_this.options.preventPageScrolling) {
                _this.preventScrolling(e, DOWN);
              }
              if (_this.prevScrollTop !== _this.maxScrollTop) {
                _this.$el.trigger('scrollend');
              }
            } else if (_this.contentScrollTop === 0) {
              if (_this.options.preventPageScrolling) {
                _this.preventScrolling(e, UP);
              }
              if (_this.prevScrollTop !== 0) {
                _this.$el.trigger('scrolltop');
              }
            }
          };
        })(this),
        wheel: (function(_this) {
          return function(e) {
            var delta;
            if (e == null) {
              return;
            }
            delta = e.delta || e.wheelDelta || (e.originalEvent && e.originalEvent.wheelDelta) || -e.detail || (e.originalEvent && -e.originalEvent.detail);
            if (delta) {
              _this.sliderY += -delta / 3;
            }
            _this.scroll();
            return false;
          };
        })(this)
      };
    };


    /**
      Adds event listeners with jQuery.
      @method addEvents
      @private
     */

    NanoScroll.prototype.addEvents = function() {
      var events;
      this.removeEvents();
      events = this.events;
      if (!this.options.disableResize) {
        this.win.bind(RESIZE, events[RESIZE]);
      }
      if (!this.iOSNativeScrolling) {
        this.slider.bind(MOUSEDOWN, events[DOWN]);
        this.pane.bind(MOUSEDOWN, events[PANEDOWN]).bind("" + MOUSEWHEEL + " " + DOMSCROLL, events[WHEEL]);
      }
      this.$content.bind("" + SCROLL + " " + MOUSEWHEEL + " " + DOMSCROLL + " " + TOUCHMOVE, events[SCROLL]);
    };


    /**
      Removes event listeners with jQuery.
      @method removeEvents
      @private
     */

    NanoScroll.prototype.removeEvents = function() {
      var events;
      events = this.events;
      this.win.unbind(RESIZE, events[RESIZE]);
      if (!this.iOSNativeScrolling) {
        this.slider.unbind();
        this.pane.unbind();
      }
      this.$content.unbind("" + SCROLL + " " + MOUSEWHEEL + " " + DOMSCROLL + " " + TOUCHMOVE, events[SCROLL]);
    };


    /**
      Generates nanoScroller's scrollbar and elements for it.
      @method generate
      @chainable
      @private
     */

    NanoScroll.prototype.generate = function() {
      var contentClass, cssRule, currentPadding, options, paneClass, sliderClass;
      options = this.options;
      paneClass = options.paneClass, sliderClass = options.sliderClass, contentClass = options.contentClass;
      if (!this.$el.find("." + paneClass).length && !this.$el.find("." + sliderClass).length) {
        this.$el.append("<div class=\"" + paneClass + "\"><div class=\"" + sliderClass + "\" /></div>");
      }
      this.pane = this.$el.children("." + paneClass);
      this.slider = this.pane.find("." + sliderClass);
      if (BROWSER_SCROLLBAR_WIDTH === 0 && isFFWithBuggyScrollbar()) {
        currentPadding = window.getComputedStyle(this.content, null).getPropertyValue('padding-right').replace(/\D+/g, '');
        cssRule = {
          right: -14,
          paddingRight: +currentPadding + 14
        };
      } else if (BROWSER_SCROLLBAR_WIDTH) {
        cssRule = {
          right: -BROWSER_SCROLLBAR_WIDTH
        };
        this.$el.addClass('has-scrollbar');
      }
      if (cssRule != null) {
        this.$content.css(cssRule);
      }
      return this;
    };


    /**
      @method restore
      @private
     */

    NanoScroll.prototype.restore = function() {
      this.stopped = false;
      if (!this.iOSNativeScrolling) {
        this.pane.show();
      }
      this.addEvents();
    };


    /**
      Resets nanoScroller's scrollbar.
      @method reset
      @chainable
      @example
          $(".nano").nanoScroller();
     */

    NanoScroll.prototype.reset = function() {
      var content, contentHeight, contentPosition, contentStyle, contentStyleOverflowY, paneBottom, paneHeight, paneOuterHeight, paneTop, parentMaxHeight, right, sliderHeight;
      if (this.iOSNativeScrolling) {
        this.contentHeight = this.content.scrollHeight;
        return;
      }
      if (!this.$el.find("." + this.options.paneClass).length) {
        this.generate().stop();
      }
      if (this.stopped) {
        this.restore();
      }
      content = this.content;
      contentStyle = content.style;
      contentStyleOverflowY = contentStyle.overflowY;
      if (BROWSER_IS_IE7) {
        this.$content.css({
          height: this.$content.height()
        });
      }
      contentHeight = content.scrollHeight + BROWSER_SCROLLBAR_WIDTH;
      parentMaxHeight = parseInt(this.$el.css("max-height"), 10);
      if (parentMaxHeight > 0) {
        this.$el.height("");
        this.$el.height(content.scrollHeight > parentMaxHeight ? parentMaxHeight : content.scrollHeight);
      }
      paneHeight = this.pane.outerHeight(false);
      paneTop = parseInt(this.pane.css('top'), 10);
      paneBottom = parseInt(this.pane.css('bottom'), 10);
      paneOuterHeight = paneHeight + paneTop + paneBottom;
      sliderHeight = Math.round(paneOuterHeight / contentHeight * paneOuterHeight);
      if (sliderHeight < this.options.sliderMinHeight) {
        sliderHeight = this.options.sliderMinHeight;
      } else if ((this.options.sliderMaxHeight != null) && sliderHeight > this.options.sliderMaxHeight) {
        sliderHeight = this.options.sliderMaxHeight;
      }
      if (contentStyleOverflowY === SCROLL && contentStyle.overflowX !== SCROLL) {
        sliderHeight += BROWSER_SCROLLBAR_WIDTH;
      }
      this.maxSliderTop = paneOuterHeight - sliderHeight;
      this.contentHeight = contentHeight;
      this.paneHeight = paneHeight;
      this.paneOuterHeight = paneOuterHeight;
      this.sliderHeight = sliderHeight;
      this.slider.height(sliderHeight);
      this.events.scroll();
      this.pane.show();
      this.isActive = true;
      if ((content.scrollHeight === content.clientHeight) || (this.pane.outerHeight(true) >= content.scrollHeight && contentStyleOverflowY !== SCROLL)) {
        this.pane.hide();
        this.isActive = false;
      } else if (this.el.clientHeight === content.scrollHeight && contentStyleOverflowY === SCROLL) {
        this.slider.hide();
      } else {
        this.slider.show();
      }
      this.pane.css({
        opacity: (this.options.alwaysVisible ? 1 : ''),
        visibility: (this.options.alwaysVisible ? 'visible' : '')
      });
      contentPosition = this.$content.css('position');
      if (contentPosition === 'static' || contentPosition === 'relative') {
        right = parseInt(this.$content.css('right'), 10);
        if (right) {
          this.$content.css({
            right: '',
            marginRight: right
          });
        }
      }
      return this;
    };


    /**
      @method scroll
      @private
      @example
          $(".nano").nanoScroller({ scroll: 'top' });
     */

    NanoScroll.prototype.scroll = function() {
      if (!this.isActive) {
        return;
      }
      this.sliderY = Math.max(0, this.sliderY);
      this.sliderY = Math.min(this.maxSliderTop, this.sliderY);
      this.$content.scrollTop((this.paneHeight - this.contentHeight + BROWSER_SCROLLBAR_WIDTH) * this.sliderY / this.maxSliderTop * -1);
      if (!this.iOSNativeScrolling) {
        this.updateScrollValues();
        this.setOnScrollStyles();
      }
      return this;
    };


    /**
      Scroll at the bottom with an offset value
      @method scrollBottom
      @param offsetY {Number}
      @chainable
      @example
          $(".nano").nanoScroller({ scrollBottom: value });
     */

    NanoScroll.prototype.scrollBottom = function(offsetY) {
      if (!this.isActive) {
        return;
      }
      this.$content.scrollTop(this.contentHeight - this.$content.height() - offsetY).trigger(MOUSEWHEEL);
      this.stop().restore();
      return this;
    };


    /**
      Scroll at the top with an offset value
      @method scrollTop
      @param offsetY {Number}
      @chainable
      @example
          $(".nano").nanoScroller({ scrollTop: value });
     */

    NanoScroll.prototype.scrollTop = function(offsetY) {
      if (!this.isActive) {
        return;
      }
      this.$content.scrollTop(+offsetY).trigger(MOUSEWHEEL);
      this.stop().restore();
      return this;
    };


    /**
      Scroll to an element
      @method scrollTo
      @param node {Node} A node to scroll to.
      @chainable
      @example
          $(".nano").nanoScroller({ scrollTo: $('#a_node') });
     */

    NanoScroll.prototype.scrollTo = function(node) {
      if (!this.isActive) {
        return;
      }
      this.scrollTop(this.$el.find(node).get(0).offsetTop);
      return this;
    };


    /**
      To stop the operation.
      This option will tell the plugin to disable all event bindings and hide the gadget scrollbar from the UI.
      @method stop
      @chainable
      @example
          $(".nano").nanoScroller({ stop: true });
     */

    NanoScroll.prototype.stop = function() {
      if (cAF && this.scrollRAF) {
        cAF(this.scrollRAF);
        this.scrollRAF = null;
      }
      this.stopped = true;
      this.removeEvents();
      if (!this.iOSNativeScrolling) {
        this.pane.hide();
      }
      return this;
    };


    /**
      Destroys nanoScroller and restores browser's native scrollbar.
      @method destroy
      @chainable
      @example
          $(".nano").nanoScroller({ destroy: true });
     */

    NanoScroll.prototype.destroy = function() {
      if (!this.stopped) {
        this.stop();
      }
      if (!this.iOSNativeScrolling && this.pane.length) {
        this.pane.remove();
      }
      if (BROWSER_IS_IE7) {
        this.$content.height('');
      }
      this.$content.removeAttr('tabindex');
      if (this.$el.hasClass('has-scrollbar')) {
        this.$el.removeClass('has-scrollbar');
        this.$content.css({
          right: ''
        });
      }
      return this;
    };


    /**
      To flash the scrollbar gadget for an amount of time defined in plugin settings (defaults to 1,5s).
      Useful if you want to show the user (e.g. on pageload) that there is more content waiting for him.
      @method flash
      @chainable
      @example
          $(".nano").nanoScroller({ flash: true });
     */

    NanoScroll.prototype.flash = function() {
      if (this.iOSNativeScrolling) {
        return;
      }
      if (!this.isActive) {
        return;
      }
      this.reset();
      this.pane.addClass('flashed');
      setTimeout((function(_this) {
        return function() {
          _this.pane.removeClass('flashed');
        };
      })(this), this.options.flashDelay);
      return this;
    };

    return NanoScroll;

  })();
  $.fn.nanoScroller = function(settings) {
    return this.each(function() {
      var options, scrollbar;
      if (!(scrollbar = this.nanoscroller)) {
        options = $.extend({}, defaults, settings);
        this.nanoscroller = scrollbar = new NanoScroll(this, options);
      }
      if (settings && typeof settings === "object") {
        $.extend(scrollbar.options, settings);
        if (settings.scrollBottom != null) {
          return scrollbar.scrollBottom(settings.scrollBottom);
        }
        if (settings.scrollTop != null) {
          return scrollbar.scrollTop(settings.scrollTop);
        }
        if (settings.scrollTo) {
          return scrollbar.scrollTo(settings.scrollTo);
        }
        if (settings.scroll === 'bottom') {
          return scrollbar.scrollBottom(0);
        }
        if (settings.scroll === 'top') {
          return scrollbar.scrollTop(0);
        }
        if (settings.scroll && settings.scroll instanceof $) {
          return scrollbar.scrollTo(settings.scroll);
        }
        if (settings.stop) {
          return scrollbar.stop();
        }
        if (settings.destroy) {
          return scrollbar.destroy();
        }
        if (settings.flash) {
          return scrollbar.flash();
        }
      }
      return scrollbar.reset();
    });
  };
  $.fn.nanoScroller.Constructor = NanoScroll;
})(jQuery, window, document);


</body></html>