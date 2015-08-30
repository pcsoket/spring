<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<head>
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>OKKY - Tech</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico" type="image/x-icon">
		<link rel="apple-touch-icon" href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
		<link rel="apple-touch-icon" sizes="114x114" href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <meta property="og:image" content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
        
        <link rel="stylesheet" href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css"/>

        <!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->

        
		<meta name="layout" content="main">
		
		
	
	</head>
	<body>
        <div class="layout-container">
            <div class="main ">
                
        


<div class="sidebar sidebar-category">

    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
    
    <h1><div class="logo"><a href="/"><img src="http://okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png" alt="OKKY" title="OKKY"/></a></div></h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a></li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="http://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
            <input type="hidden" name="q" />
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>

    <div class="nav-user nav-sidebar">
        
        
            
            <ul class="nav nav-sidebar">
                <li data-toggle="tooltip" data-container="body" title="로그인"><a href="/login/auth?redirectUrl=%2Farticles%2Ftech" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                <li data-toggle="tooltip" data-container="body" title="회원가입"><a href="/user/register" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
            </ul>
        
    </div>

    <ul class="nav nav-sidebar nav-main">
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
        
            <li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/articles/jobs" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
        
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>


<div class="sidebar-category-nav">
<h3 class="sub-title">Tech</h3>
<ul class="nav">
    <li><a href="/articles/tech" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/news" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT News & 정보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/tips" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Tips & 강좌</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
</ul>
</div>

		<div id="list-article" class="content scaffold-list" role="main">
            <div class="nav" role="navigation">
                <a href="/articles/tech/create" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
                
                <h4>Tech</h4>
                <div class="category-filter-wrapper">
                    <form action="/articles/tech" method="get" name="category-filter-form" id="category-filter-form" >
                        <div class="category-filter-query pull-right">
                            <div class="input-group input-group-sm">
                                <input type="search" name="query" class="form-control" placeholder="검색어" value="" />
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    
                                </span>
                            </div>
                        </div>
                        <ul class="list-sort pull-left">
                            <li><a href="/articles/tech?sort=id&amp;order=desc" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
                            <li><a href="/articles/tech?sort=voteCount&amp;order=desc" data-sort="voteCount" data-order="desc" class="category-sort-link ">추천순</a></li>
                            <li><a href="/articles/tech?sort=noteCount&amp;order=desc" data-sort="noteCount" data-order="desc" class="category-sort-link ">댓글순</a></li>
                            <li><a href="/articles/tech?sort=scrapCount&amp;order=desc" data-sort="scrapCount" data-order="desc" class="category-sort-link ">스크랩순</a></li>
                            <li><a href="/articles/tech?sort=viewCount&amp;order=desc" data-sort="viewCount" data-order="desc" class="category-sort-link ">조회순</a></li>
                        </ul>
                        <input type="hidden" name="sort" id="category-sort-input" value="id"/>
                        <input type="hidden" name="order" id="category-order-input" value="desc"/>
                    </form>
                </div>

            </div>
            <div class="panel panel-default">

                <!-- Table -->

                <ul class="list-group">

                    

                    

                        

                        

                        <li class="list-group-item  list-group-no-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290986</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/node.js" class="list-group-item-text item-tag label label-gray">node.js</a> <a href="/articles/tagged/java" class="list-group-item-text item-tag label label-gray">java</a> <a href="/articles/tagged/.net" class="list-group-item-text item-tag label label-gray">.net</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290986">Node.js가 java와 .net을 물리친 이유</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 760</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/163' class='avatar-photo'><img src='//www.gravatar.com/avatar/8facb3ba937b6f1cfcbd9c8f059acbcf?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/163">kenu</a> <div class="activity"><span class="fa fa-flash"></span> 29k</div><div class="date-created timeago" title="2015-08-27 16:13:59.0">2015-08-27 16:13:59.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290879</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/사물인터넷" class="list-group-item-text item-tag label label-gray">사물인터넷</a> <a href="/articles/tagged/HEMS" class="list-group-item-text item-tag label label-gray">HEMS</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290879">드디어 실생활로 들어온  IoT</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 3</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 511</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/22006' class='avatar-photo'><img src='//www.gravatar.com/avatar/19a0cdf38adcec82f855619524e621ea?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22006">하마</a> <div class="activity"><span class="fa fa-flash"></span> -80</div><div class="date-created timeago" title="2015-08-27 09:44:09.0">2015-08-27 09:44:09.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290862</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/자바" class="list-group-item-text item-tag label label-gray">자바</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290862">자바 개발자가 저지르기쉬운 열가지 실수</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 3</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 753</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/34090' class='avatar-photo'><img src='//www.gravatar.com/avatar/94ffdac569ac7d4f3adb0da03a608293?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/34090">정개발</a> <div class="activity"><span class="fa fa-flash"></span> 379</div><div class="date-created timeago" title="2015-08-27 07:29:36.0">2015-08-27 07:29:36.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        

                        <li class="list-group-item  list-group-no-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290468</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/si" class="list-group-item-text item-tag label label-gray">si</a> <a href="/articles/tagged/나프다" class="list-group-item-text item-tag label label-gray">나프다</a> <a href="/articles/tagged/나는프로그래머다" class="list-group-item-text item-tag label label-gray">나는프로그래머다</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290468">나는 프로그래머다 11화 - SI이노베이션 (오키 운영자 허광남님 출연)</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 3</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 687</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/34090' class='avatar-photo'><img src='//www.gravatar.com/avatar/94ffdac569ac7d4f3adb0da03a608293?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/34090">정개발</a> <div class="activity"><span class="fa fa-flash"></span> 379</div><div class="date-created timeago" title="2015-08-25 07:21:58.0">2015-08-25 07:21:58.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290232</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/JavaScript" class="list-group-item-text item-tag label label-gray">JavaScript</a> <a href="/articles/tagged/Java" class="list-group-item-text item-tag label label-gray">Java</a> <a href="/articles/tagged/Python" class="list-group-item-text item-tag label label-gray">Python</a> <a href="/articles/tagged/Quora" class="list-group-item-text item-tag label label-gray">Quora</a> <a href="/articles/tagged/Language" class="list-group-item-text item-tag label label-gray">Language</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290232">&quot;자바, 파이썬, 자바스크립트 중 가장 전망있는 언어?&quot;</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 3</li>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/21016' class='avatar-photo'><img src='//www.gravatar.com/avatar/f50ed624226bd860725f788e4dcdbb47?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/21016">sbroh</a> <div class="activity"><span class="fa fa-flash"></span> 2k</div><div class="date-created timeago" title="2015-08-22 20:54:19.0">2015-08-22 20:54:19.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#290229</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/290229">2015 년 8월 현재 인기언어 순위 [TIOBE index]</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 9</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/22006' class='avatar-photo'><img src='//www.gravatar.com/avatar/19a0cdf38adcec82f855619524e621ea?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22006">하마</a> <div class="activity"><span class="fa fa-flash"></span> -80</div><div class="date-created timeago" title="2015-08-22 20:15:43.0">2015-08-22 20:15:43.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        

                        <li class="list-group-item  list-group-no-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#289874</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/유효성" class="list-group-item-text item-tag label label-gray">유효성</a> <a href="/articles/tagged/validate" class="list-group-item-text item-tag label label-gray">validate</a> <a href="/articles/tagged/라이브러리" class="list-group-item-text item-tag label label-gray">라이브러리</a> <a href="/articles/tagged/자바스크립트" class="list-group-item-text item-tag label label-gray">자바스크립트</a> <a href="/articles/tagged/정규식" class="list-group-item-text item-tag label label-gray">정규식</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/289874">sjutil_RE_validate.js 확장성이 편한 정규식 유효성 검사 자바스크립트 유틸</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 4</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 420</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/30174' class='avatar-photo'><img src='//www.gravatar.com/avatar/2d03820936cd20f51a70030900f01bf7?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/30174">latelove</a> <div class="activity"><span class="fa fa-flash"></span> 109</div><div class="date-created timeago" title="2015-08-20 09:39:11.0">2015-08-20 09:39:11.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#289273</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/Chain" class="list-group-item-text item-tag label label-gray">Chain</a> <a href="/articles/tagged/of" class="list-group-item-text item-tag label label-gray">of</a> <a href="/articles/tagged/Responsibil" class="list-group-item-text item-tag label label-gray">Responsibil</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/289273">JDBC 과 디자인패턴 이야기 - (4) Chain of Responsibility 패턴</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 6</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 859</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/22006' class='avatar-photo'><img src='//www.gravatar.com/avatar/19a0cdf38adcec82f855619524e621ea?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22006">하마</a> <div class="activity"><span class="fa fa-flash"></span> -80</div><div class="date-created timeago" title="2015-08-14 20:10:25.0">2015-08-14 20:10:25.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#289131</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/289131">클라우드지원센터 SW개발환경 무료 지원</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 632</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/36872' class='avatar-photo'><img src='//graph.facebook.com/131826957158793/picture?width=30&height=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/36872">강정</a> <div class="activity"><span class="fa fa-flash"></span> 12</div><div class="date-created timeago" title="2015-08-13 16:24:05.0">2015-08-13 16:24:05.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#288215</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/프로젝트관리" class="list-group-item-text item-tag label label-gray">프로젝트관리</a> <a href="/articles/tagged/간트차트" class="list-group-item-text item-tag label label-gray">간트차트</a> <a href="/articles/tagged/auiproject" class="list-group-item-text item-tag label label-gray">auiproject</a> <a href="/articles/tagged/일정관리" class="list-group-item-text item-tag label label-gray">일정관리</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/288215">[소개] 간트차트 기반 무료 일정, 프로젝트 관리 국내 사이트</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 5</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/33003' class='avatar-photo'><img src='//www.gravatar.com/avatar/cc7e23f5f3515f96aa7fc8e186013888?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/33003">에이유아이</a> <div class="activity"><span class="fa fa-flash"></span> 43</div><div class="date-created timeago" title="2015-08-06 16:03:28.0">2015-08-06 16:03:28.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#287958</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/JDBC" class="list-group-item-text item-tag label label-gray">JDBC</a> <a href="/articles/tagged/State" class="list-group-item-text item-tag label label-gray">State</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/287958">JDBC 과 디자인패턴 이야기 - (3) State 패턴</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 3</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 9</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/22006' class='avatar-photo'><img src='//www.gravatar.com/avatar/19a0cdf38adcec82f855619524e621ea?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22006">하마</a> <div class="activity"><span class="fa fa-flash"></span> -80</div><div class="date-created timeago" title="2015-08-05 11:40:43.0">2015-08-05 11:40:43.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#287832</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/jennniferui" class="list-group-item-text item-tag label label-gray">jennniferui</a> <a href="/articles/tagged/jui" class="list-group-item-text item-tag label label-gray">jui</a> <a href="/articles/tagged/svgchart" class="list-group-item-text item-tag label label-gray">svgchart</a> <a href="/articles/tagged/juistore" class="list-group-item-text item-tag label label-gray">juistore</a> <a href="/articles/tagged/ui" class="list-group-item-text item-tag label label-gray">ui</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/287832">JUI 스토어 소개: 차트 및 테마, SVG 맵 공유 서비스</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 888</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/11324' class='avatar-photo'><img src='//www.gravatar.com/avatar/4a2a30c16c51fb21e2ede644bf8e277b?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/11324">seogi1004</a> <div class="activity"><span class="fa fa-flash"></span> 194</div><div class="date-created timeago" title="2015-08-04 16:48:10.0">2015-08-04 16:48:10.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#287478</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/bash" class="list-group-item-text item-tag label label-gray">bash</a> <a href="/articles/tagged/shell" class="list-group-item-text item-tag label label-gray">shell</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/287478">BASH 쉘 스크립트 가이드</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 4</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/11582' class='avatar-photo'><img src='//www.gravatar.com/avatar/e6b83b2c0f4cbe255a588c45e88edb94?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/11582">mug896</a> <div class="activity"><span class="fa fa-flash"></span> 285</div><div class="date-created timeago" title="2015-08-01 14:43:58.0">2015-08-01 14:43:58.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#287133</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/JDBC" class="list-group-item-text item-tag label label-gray">JDBC</a> <a href="/articles/tagged/AbstractFactory" class="list-group-item-text item-tag label label-gray">AbstractFactory</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/287133">JDBC  과  디자인패턴 이야기 - (1/2)</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 3</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 9</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/22006' class='avatar-photo'><img src='//www.gravatar.com/avatar/19a0cdf38adcec82f855619524e621ea?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22006">하마</a> <div class="activity"><span class="fa fa-flash"></span> -80</div><div class="date-created timeago" title="2015-07-29 22:31:36.0">2015-07-29 22:31:36.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        

                        <li class="list-group-item  list-group-no-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#286979</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/나프다" class="list-group-item-text item-tag label label-gray">나프다</a> <a href="/articles/tagged/나는프로그래머다" class="list-group-item-text item-tag label label-gray">나는프로그래머다</a> <a href="/articles/tagged/스칼라" class="list-group-item-text item-tag label label-gray">스칼라</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/286979">나는 프로그래머다 - Episode 8: 스칼라 특집 2부</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/34090' class='avatar-photo'><img src='//www.gravatar.com/avatar/94ffdac569ac7d4f3adb0da03a608293?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/34090">정개발</a> <div class="activity"><span class="fa fa-flash"></span> 379</div><div class="date-created timeago" title="2015-07-29 07:50:34.0">2015-07-29 07:50:34.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#286849</span>
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/286849">안드로이드 전화번호만 알아도 해킹된다.</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/21287' class='avatar-photo'><img src='//www.gravatar.com/avatar/f8d1cec4360b81dae2e41e1696cf5563?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/21287">미림</a> <div class="activity"><span class="fa fa-flash"></span> 471</div><div class="date-created timeago" title="2015-07-28 12:22:26.0">2015-07-28 12:22:26.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#286783</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/스프링" class="list-group-item-text item-tag label label-gray">스프링</a> <a href="/articles/tagged/IoC" class="list-group-item-text item-tag label label-gray">IoC</a> <a href="/articles/tagged/DI" class="list-group-item-text item-tag label label-gray">DI</a> <a href="/articles/tagged/AOP" class="list-group-item-text item-tag label label-gray">AOP</a> <a href="/articles/tagged/PSA" class="list-group-item-text item-tag label label-gray">PSA</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/286783">스프링 초급 입문 강좌</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 8</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 2k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/21362' class='avatar-photo'><img src='//www.gravatar.com/avatar/b51ada12d4d3fdc1a4192469d0ff5e08?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/21362">초보람보</a> <div class="activity"><span class="fa fa-flash"></span> 438</div><div class="date-created timeago" title="2015-07-27 23:05:03.0">2015-07-27 23:05:03.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#286581</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/java8" class="list-group-item-text item-tag label label-gray">java8</a> <a href="/articles/tagged/자바" class="list-group-item-text item-tag label label-gray">자바</a> <a href="/articles/tagged/나프다" class="list-group-item-text item-tag label label-gray">나프다</a> <a href="/articles/tagged/나는프로그래머다" class="list-group-item-text item-tag label label-gray">나는프로그래머다</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/286581">8월 1일 예정 - 실전 자바8 프로그래밍 웨비너</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 2</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/34090' class='avatar-photo'><img src='//www.gravatar.com/avatar/94ffdac569ac7d4f3adb0da03a608293?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/34090">정개발</a> <div class="activity"><span class="fa fa-flash"></span> 379</div><div class="date-created timeago" title="2015-07-25 22:45:19.0">2015-07-25 22:45:19.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        

                        <li class="list-group-item  list-group-no-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#286580</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/하스켈" class="list-group-item-text item-tag label label-gray">하스켈</a> <a href="/articles/tagged/haskell" class="list-group-item-text item-tag label label-gray">haskell</a> <a href="/articles/tagged/나프다" class="list-group-item-text item-tag label label-gray">나프다</a> <a href="/articles/tagged/발렌타인" class="list-group-item-text item-tag label label-gray">발렌타인</a> <a href="/articles/tagged/나는프로그래머다" class="list-group-item-text item-tag label label-gray">나는프로그래머다</a> 
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/286580">발렌타인 웨비너 - 순수 함수형언어 하스켈에 대하여</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-comment "></i> 0</li>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i> 0</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 653</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/34090' class='avatar-photo'><img src='//www.gravatar.com/avatar/94ffdac569ac7d4f3adb0da03a608293?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/34090">정개발</a> <div class="activity"><span class="fa fa-flash"></span> 379</div><div class="date-created timeago" title="2015-07-25 22:29:47.0">2015-07-25 22:29:47.0</div></div></div>
                            </div>
                        </li>
                    

                        

                        
                            
                        

                        <li class="list-group-item  list-group-has-note clearfix">

                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                    <span class="list-group-item-text article-id">#285948</span>
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    
                                </div>

                                <h5 class="list-group-item-heading ">
                                    <a href="/article/285948">Bootstrap 3 튜토리얼</a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                        <ul>
                                            <li class=""><i class="item-icon fa fa-comment "></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-thumbs-up"></i> 1</li>
                                            <li class=""><i class="item-icon fa fa-eye"></i> 1k</li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <div class="list-group-item-author clearfix">
                                <div class='avatar avatar-list clearfix '><a href='/user/info/10858' class='avatar-photo'><img src='//www.gravatar.com/avatar/6679d195b7b6faaa9a639cb75738da26?d=identicon&s=30'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/10858">draghome</a> <div class="activity"><span class="fa fa-flash"></span> 609</div><div class="date-created timeago" title="2015-07-21 10:26:59.0">2015-07-21 10:26:59.0</div></div></div>
                            </div>
                        </li>
                    
                </ul>
            </div>
            <div class="text-center">
                
                    <ul class="pagination pagination-sm"><li class="prev disabled"><span>&laquo;</span></li><li class="active"><span>1</span></li><li><a href="/articles/tech?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">2</a></li><li><a href="/articles/tech?offset=40&amp;max=20&amp;sort=id&amp;order=desc" class="step">3</a></li><li><a href="/articles/tech?offset=60&amp;max=20&amp;sort=id&amp;order=desc" class="step">4</a></li><li><a href="/articles/tech?offset=80&amp;max=20&amp;sort=id&amp;order=desc" class="step">5</a></li><li><a href="/articles/tech?offset=100&amp;max=20&amp;sort=id&amp;order=desc" class="step">6</a></li><li><a href="/articles/tech?offset=120&amp;max=20&amp;sort=id&amp;order=desc" class="step">7</a></li><li><a href="/articles/tech?offset=140&amp;max=20&amp;sort=id&amp;order=desc" class="step">8</a></li><li><a href="/articles/tech?offset=160&amp;max=20&amp;sort=id&amp;order=desc" class="step">9</a></li><li><a href="/articles/tech?offset=180&amp;max=20&amp;sort=id&amp;order=desc" class="step">10</a></li><li class="disabled"><span>...</span></li><li><a href="/articles/tech?offset=6640&amp;max=20&amp;sort=id&amp;order=desc" class="step">333</a></li><li class="next"><a href="/articles/tech?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">&raquo;</a></li></ul>
                
            </div>
		</div>
        
	
                <div class="right-banner-wrapper">

                    
                
                    <div class="google-ad">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- okjspad_160x600 -->
                        <ins class="adsbygoogle"
                             style="display:inline-block;width:160px;height:600px"
                             data-ad-client="ca-pub-8103607814406874"
                             data-ad-slot="6573675943"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </div>
                </div>
                <div id="footer" class="footer" role="contentinfo">
                    <div class="row">
    <div class="col-sm-6">
        <div style="float: left;margin-right: 10px;">
            <img src="http://okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
        </div>
        <div>
            <a href="/intro/about">About OKKY</a>
            | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
            | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v0.7.8
            <br/> @ 2015 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
        </div>
    </div>
    <div class="sponsor-banner col-sm-6">
        <a href="http://www.hanbit.co.kr" target="_blank"><img src="http://okky.kr/assets/spb_hb2-b6666fbb2c4778a64b386e89e0b4dd9f.png" /></a>
        <a href="http://alert.cidow.com" target="_blank"><img src="http://okky.kr/assets/spb_alert-5415d4607b9b8831cea9f7b59edf49c6.png" /></a>
        <a href="http://www.80port.com" target="_blank"><img src="http://okky.kr/assets/spb_port80-276554688f11177fae25fb25fbb538b4.png" /></a>
    </div>
</div>


                </div>
            </div>
        </div>
        <script>
            var contextPath = "", encodedURL = "%2Farticles%2Ftech";
        </script>
        <script src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js" type="text/javascript" ></script>
        <script src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript" ></script>
        
        
            <script>
            $(function() {
                $('.category-sort-link').click(function(e) {
                    $('#category-sort-input').val($(this).data('sort'));
                    $('#category-order-input').val($(this).data('order'));
                    e.preventDefault();
                    $('#category-filter-form')[0].submit();
                });
            });
            </script>
        
        
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-6707625-5', 'auto');
            ga('send', 'pageview');

        </script>


        <div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

        <div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

    </body>
</html>
