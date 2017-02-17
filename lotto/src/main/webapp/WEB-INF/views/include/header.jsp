<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lotto Home</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- SB Admin CSS -->
<link href="/resources/vendor/sbadmin/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<link href="/resources/stylesheets/userregist.css" rel="stylesheet">
<link href="/resources/stylesheets/lottonumber.css" rel="stylesheet">

</head>
<body>
<!-- 회원가입 Modal -->
<form action="/user/regist" method="post" id="newmember">
	<div class="modal fade" id="becomeamember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
						<span class="sr-only">닫기</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<!-- <div class="modal-body form-inline">  -->
				<div class="modal-body">
					<div class="form-group">
						<label for="inputId" class="control-label">아이디</label>
						<input type="text" class="form-control" id="inputId" name="uid" placeholder="아이디">
					</div>
					<div class="form-group">
						<label for="inputPassword" class="control-label">비밀번호</label>
						<input type="password" class="form-control" id="inputPassword" name="upw" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck" class="control-label">비밀번호 확인</label>
						<input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
					<div class="form-group">
						<label for="inputName" class="control-label">이름</label>
						<input type="text" class="form-control" id="inputName" name="uname" placeholder="이름">
					</div>
					<div class="form-group">
						<label for="inputmobileNumber" class="control-label">휴대폰번호</label>
						<input type="text" class="form-control" id="inputmobileNumber" name="uphonenum" placeholder="휴대폰번호">
						<p class="help-block">- 없이 적어주세요.</p>
					</div>
					<div class="form-group">
						<label for="inputAgree" class="control-label">약관 동의</label><br>
							<label>
								<input id="agree" type="checkbox"> 이용약관에 동의합니다.
							</label>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>
				</div>
				<!-- end modal-Body -->
			</div>
		</div>
	</div>
	<!-- end become a member modal -->
</form>
<!-- end Form -->

<!-- 로그인 Modal -->
<form id="logingform" action="/" method="post">
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">로그인</h4>
				</div>

				<div class="modal-body">
					<div class="form-group has-feedback">
						<label class="control-label">아이디</label>
						<input type="email" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status" placeholder="아이디">
					</div>

					<div class="form-group has-feedback">
						<label class="control-label">패스워드</label>
						<input type="password" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status" placeholder="패스워드">
					</div>

					<button type="button" class="btn btn-primary">로그인</button>
					<input type="checkbox" value="rememberme" id="rememberme">자동로그인
					<br />
					<br />
					<a href="#">패스워드 찾기</a>
				</div>
				<div class="modal-footer">
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
					<a data-toggle="modal" data-target="#becomeamember" data-dismiss="modal"> 여기</a>를 눌러 회원가입 하세요.
				</div>
			</div>
		</div>
	</div>
	<!-- end become a member modal -->
</form>
<!-- end login form -->

<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/resources/vendor/sbadmin/js/sb-admin-2.js"></script>

<div id="wrapper">

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">로또 - by Jinhyuc</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">

			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-messages">
					<li>
						<a class="text-center" href="#">
							<strong>Read All Messages</strong>
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
				</ul>
				<!-- /.dropdown-messages -->
			</li>
			<!-- /.dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li>
						<a class="text-center" href="#">
							<strong>See All Alerts</strong>
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
				</ul>
				<!-- /.dropdown-alerts -->
			</li>
			<!-- /.dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li>
						<a href="#">
							<i class="fa fa-user fa-fw"></i> 나의정보
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fa fa-gear fa-fw"></i> 설정
						</a>
					</li>
					<li class="divider"></li>
					<li>
						<a data-toggle="modal" data-target="#login">
							<i class="fa fa-sign-out fa-fw"></i> 로그아웃
						</a>
					</li>
				</ul>
				<!-- /.dropdown-user -->
			</li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
						<!-- /input-group -->
					</li>
					<li>
						<a href="#">
							<i class="fa fa-money fa-fw"></i> LOTTO 정보
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li>
								<a href="#">회차별 당첨번호</a>
							</li>
							<li>
								<a href="/info/store">LOTTO 판매점</a>
							</li>
						</ul>
						<!-- /.nav-second-level -->
					</li>
					<li>
						<a href="#">
							<i class="fa fa-pencil fa-fw"></i> LOTTO 번호 생성
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li>
								<a href="#">추천번호로 생성</a>
							</li>
							<li>
								<a href="#">직접 입력</a>
							</li>
						</ul>
						<!-- /.nav-second-level -->
					</li>
					<li>
						<a href="#">
							<i class="fa fa-comments-o fa-fw"></i> 게시판
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li>
								<a href="#">자유게시판</a>
							</li>
							<li>
								<a href="#">질문게시판</a>
							</li>
						</ul>
						<!-- /.nav-second-level -->
					</li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
	</nav>