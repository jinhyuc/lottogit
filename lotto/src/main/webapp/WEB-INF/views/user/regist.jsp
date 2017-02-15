<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/stylesheets/login.css" rel="stylesheet">
</head>
<body>
	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>회원가입</h1>
		</div>
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label for="inputId" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputId"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPasswordCheck"
						placeholder="비밀번호 확인">
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputName"
						placeholder="이름">
				</div>
			</div>
			<div class="form-group">
				<label for="inputmobileNumber" class="col-sm-2 control-label">휴대폰번호</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputmobileNumber"
						placeholder="휴대폰번호">
					<p class="help-block">- 없이 적어주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
				<div class="col-sm-6 checkbox">
					<label> <input id="agree" type="checkbox"> 이용약관에 동의합니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</div>
		</form>
		</article>
	</div>
</body>
</html>