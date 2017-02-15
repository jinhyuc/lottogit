<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/stylesheets/login.css" rel="stylesheet">
</head>
<body>
    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">로그인</h2>
        <label for="inputId" class="sr-only">아이디</label>
        <input type="text" id="inputId" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">패스워드</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 자동로그인
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      </form>

    </div> <!-- /container -->
</body>
</html>