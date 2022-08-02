<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- BootStrap Icon -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/hellobook.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<title>Hello Book</title>
</head>
<body>

<header class="p-3 mb-3 border-bottom nav-gradation sticky">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-lg-start nav-right">

        <ul class="nav col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 nav-logo">
            <li><a href="/" class="nav-link link-dark fs-3">Hello Book</a></li>
        </ul>

        <ul class="nav col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 nav-search">
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
            </form>
        </ul>

        <div class="dropdown d-flex justify-content-center text-end nav-memu">
            <div class="mx-2">
            	<a href="/">
            		<img src="https://img.icons8.com/ios-glyphs/30/000000/home-page--v1.png"/>
            	</a>
            </div>
            <div class="mx-2">
            	<a href="/friend/list">
            		<img src="https://img.icons8.com/ios-glyphs/30/000000/contacts.png"/>
            	</a>
            </div>
            <div class="mx-2">
            	<a href="/chat/chat_list">
                	<img src="https://img.icons8.com/ios-glyphs/30/000000/speech-bubble-with-dots.png"/>
                </a>
            </div>
            <div class="mx-2">
            	<a href="/post/post_write">
                	<img src="https://img.icons8.com/ios-glyphs/30/000000/add--v1.png"/>
                </a>
            </div>
            <div class="mx-2">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://img.icons8.com/ios-glyphs/30/000000/small-icons.png"/>
                </a>
                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="/mypage/mypage">프로필</a></li>
                    <li><a class="dropdown-item" href="/mypage/post">내가 쓴 글</a></li>
                    <li><a class="dropdown-item" href="/mypage/like">좋아요한 글</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><img src="https://img.icons8.com/external-sbts2018-mixed-sbts2018/20/000000/external-logout-social-media-basic-1-sbts2018-mixed-sbts2018.png"/>로그아웃</a></li>
                </ul>
            </div>
        </div>

        </div>
    </div>
</header>