<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">
		
		
<!-- 		<div class="font-test" style="border: soild 3px black; margin: 100px; font-size: 30px; line-height: 1.5; word-break: break-word"> -->
<!-- 			<p>이것은 30px 한글입니다 ~ 12341231241 10월 10일</p> -->
<!-- 			<p>This is English ~ 10 10 1212412</p> -->
<!-- 			<p> -->
<!-- 				これは、日本語でござる。気持ちいい。12345　10月10日　2022年　あかさたなはまやらわ　アカサタナハマヤラワ -->
<!-- 				与 両 乗 予 争 互 亡 交 他 付 件 任 伝 似 位 余 例 供 便 係 信 倒 候 値 偉 側 偶 備 働 優 光 全 共 具 内 冷 処 列 初 判 利 到 制 刻 割 加 助 努 労 務 勝 勤 化 単 危 原 参 反 収 取 受 可 号 合 向 君 否 吸 吹 告 呼 命 和 商 喜 回 因 困 園 在 報 増 声 変 夢 太 夫 失 好 妻 娘 婚 婦 存 宅 守 完 官 定 実 客 害 容 宿 寄 富 寒 寝 察 対 局 居 差 市 師 席 常 平 幸 幾 座 庭 式 引 当 形 役 彼 徒 得 御 必 忘 忙 念 怒 怖 性 恐 恥 息 悲 情 想 愛 感 慣 成 戦 戻 所 才 打 払 投 折 抜 抱 押 招 指 捕 掛 探 支 放 政 敗 散 数 断 易 昔 昨 晩 景 晴 暗 暮 曲 更 最 望 期 未 末 束 杯 果 格 構 様 権 横 機 欠 次 欲 歯 歳 残 段 殺 民 求 決 治 法 泳 洗 活 流 浮 消 深 済 渡 港 満 演 点 然 煙 熱 犯 状 猫 王 現 球 産 由 申 留 番 疑 疲 痛 登 皆 盗 直 相 眠 石 破 確 示 礼 祖 神 福 科 程 種 積 突 窓 笑 等 箱 米 精 約 組 経 給 絵 絶 続 緒 罪 置 美 老 耳 職 育 背 能 腹 舞 船 良 若 苦 草 落 葉 薬 術 表 要 規 覚 観 解 記 訪 許 認 誤 説 調 談 論 識 警 議 負 財 貧 責 費 資 賛 越 路 身 辞 込 迎 返 迷 追 退 逃 途 速 連 進 遅 遊 過 達 違 遠 適 選 部 都 配 酒 閉 関 阪 降 限 除 険 陽 際 雑 難 雪 静 非 面 靴 頂 頭 頼 顔 願 類 飛 首 馬 髪 鳴 -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 		<div class="font-test" style="border: soild 3px black; margin: 50px; font-size: 20px; line-height: 1.5;"> -->
<!-- 			<p>이것은 20px 한글입니다 ~ 12341231241 10월 10일</p> -->
<!-- 			<p>This is English ~ 10 10 1212412</p> -->
<!-- 			<p>これは、日本語でござる。分かりました。難しい。優しい。気持ちいい。<br>12345　10月10日　2022年　社長　先生　学生　大学　あかさたなはまやらわ　アカサタナハマヤラワ</p> -->
<!-- 		</div> -->
<!-- 		<div class="font-test" style="border: soild 3px black; margin: 50px; font-size: 10px; line-height: 1.5;"> -->
<!-- 			<p>이것은 12px 한글입니다 ~</p> -->
<!-- 			<p>This is English ~</p> -->
<!-- 			<p>これは、日本語でござる。分かりました。難しい。優しい。気持ちいい。<br>12345　10月10日　2022年　社長　先生　学生　大学　あかさたなはまやらわ　アカサタナハマヤラワ</p> -->
<!-- 		</div> -->
			
			<!-- post -->
			<div class="col-lg-7">
				<div class="row post-box">
					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container" onclick="location.href='#'">
								<div class="profile_img">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필이미지">
								</div>
								<div class="profile_flag">
									<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>
								</div>
								<div class="user_name">
									<div class="nick_name m_text">Hanulso</div>
									<div class="mt-1 s_text">東京, 日本</div>
								</div>
							</div>
<!-- 							<div class="sprite_more_icon" data-name="more" onclick="location.href='#'"></div> -->
								<sec:authorize access="isAuthenticated()">
								     <c:if test="true">
										<div style="display:flex;" >
											<span style="margin-left:auto;"><a href="/post/post_update">게시물 수정</a> | <a href="/post/post_delete">게시물 삭제</a></span>
										</div>
								     </c:if>
								</sec:authorize>
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
								<div id="carousel1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="/resources/imgs/long.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/thumb.jpeg" alt="...">
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="left_icons">
								<div class="sprite_heart_icon_outline on_cursor" name="39" data-name="heartbeat"></div>
								<span class="heart-count on_cursor">39 명이 좋아합니다</span>
							</div>
							<div class="right_icon">
<!-- 							<div class="sprite_bubble_icon"></div> -->
								<div class="sprite_share_icon on_cursor" data-name="share"></div>
							</div>
						</div>

						<div class="posting-master">
							<p class="posting-master-name">Hanulso</p>
							<div class="posting-master-content">
								두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다 두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다 두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다
							</div>
						</div>

						<div class="timer">36분 전</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<div class="comment">
								<div class="nick_name m_text">long name userrrrrrrrrrr</div>
								<div class="real_comment">
									<span class="hashTag" onclick="location.href='#'">@TagMe</span>
									강아지가 너무 귀여워요!
								</div>
							</div>
							<div class="comment">
								<div class="nick_name m_text">jgc</div>
								<div class="real_comment">
									尻尾が長すぎ ! Too long tail ! 강아지 꼬리가 너무 길어요 ! 강아지 꼬리가 너무 길어요 ! 
								</div>
							</div>
							<div class="comment">
								<div class="nick_name m_text">Hong Gil Dong</div>
								<div class="real_comment">
									대표댓글 3명까지, 더보기는 "하단 점점점" 클릭 !
								</div>
							</div>
							<div class="more-comment-div">
								<span class="more-comment">...</span>
							</div>
							
						</div>
					</article>

					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container" onclick="location.href='#'">
								<div class="profile_img">
									<img src="/resources/imgs/thumb.jpeg" alt="프로필이미지">
								</div>
								<div class="profile_flag">
									<img class="flag_icon" src="https://img.icons8.com/color/25/000000/south-korea-circular.png"/>
								</div>
								<div class="user_name">
									<div class="nick_name m_text">Hellobook</div>
									<div class="country s_text">Seoul, South Korea</div>
								</div>
							</div>
<!-- 							<div class="sprite_more_icon" date-name="more" onclick="location.href='#'"></div> -->
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
<!-- 								<div> -->
<!-- 									<img src="/resources/imgs/img_section/img01.jpg" alt="visual01"> -->
<!-- 								</div> -->
								<div id="carousel2" class="carousel slide" data-bs-ride="carousel"  data-bs-interval="false">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="/resources/imgs/long.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carousel2" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carousel2" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="left_icons">
								<div class="heart_btn">
									<div class="sprite_heart_icon_outline" name="39"
										data-name="heartbeat"></div>

								</div>
								<div class="sprite_bubble_icon"></div>
								<div class="sprite_share_icon" data-name="share"></div>
							</div>

							<div class="right_icon">
								<div class="sprite_bookmark_outline" data-name="bookmark"></div>
							</div>

						</div>

						<div class="likes m_text">
							좋아요 <span id="count">50</span>개
						</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<div class="comment">
								<div class="nick_name m_text">beak1</div>
								<div>강아지가 너무 귀여워요!</div>
							</div>
<!-- 							<div class="small_heart_btn"> -->
<!-- 								<div class="sprite_small_heart_icon_outline" -->
<!-- 									data-name="commentheart"></div> -->
<!-- 							</div> -->
						</div>

						<div class="timer">36분 전</div>

					</article>

				</div>
			</div>
			<!-- //post -->


			<div class="col-md-3" align="center">
				<div class="side_box sticky-side my-5">
				
					<!-- 개인 프로필
					<div class="user_profile">
						<div class="profile_thumb">
							<img src="imgs/thumb.jpeg" alt="프로필사진">
						</div>
						<div class="detail">
							<div class="id m_text">Hellobook</div>
							<div class="ko_name">헬로북</div>
						</div>
					</div> -->
					
					<article class="story">
						<header class="story_header">
							<div>친구 리스트</div>
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/friend/list'"></div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb" onclick="location.href='#'">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id" onclick="location.href='#'">im_online</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb" onclick="location.href='#'">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id" onclick="location.href='#'">im_online</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">1시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">2시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>친구 추천</div>
<!-- 							<div class="more">모두 보기</div> -->
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/'"></div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">im_online</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-plus-lg" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-plus-lg" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-plus-lg" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>

		</div>
	</div>
</div>


<div class="modal-background">
	<div class="closeModalBtnDiv">
		<span class="closeModalBtn fs-5 text-white on_cursor">X</span>
	</div>

	<div class="modal-detail">
		<div class="container-fluid">
			<div class="row">
			
				<div class="col-md-7" style="padding: 0px">
				<div class="modal-detail-left d-flex flex-column">
					<div class="trans_inner">
						<div id="carousel-modal1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="/resources/imgs/long.jpg" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/logo.png" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/thumb.jpeg" alt="...">
						    </div>
						  </div>
						  <button class="carousel-control-prev" type="button" data-bs-target="#carousel-modal1" data-bs-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Previous</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#carousel-modal1" data-bs-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="visually-hidden">Next</span>
						  </button>
						</div>
					</div>
					<div class="modal-detail-contents">
						<div class="posting-master">
							<div class="comment-profile d-flex">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">1시간 전</div>
								
							</div>
							
							<div class="modal-posting-master-content">
								여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
							</div>
						</div>
					</div>
				</div>
				</div>
				
				<div class="col-md-5" style="padding: 0;">
					<div class="modal-detail-right">
						<div class="all-comment">				
								
							<p class="fs-5 mb-3">댓글 리스트</p>
							
							
							<div class="comment-profile d-flex">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">17분전</div>
								<div class="comment-cocoment align-self-center">답글 달기</div>
							</div>
							<div class="comment-content">
								하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 
							</div>
							<!-- c:if 대댓글 개수가 1 이상이면 -->
							<div class="mt-3 ms-3 on_cursor">
								<i class="bi bi-arrow-return-right fs-5"></i>
								<span class="cocoment-open ms-3">펼치기 / 접기</span>
							</div>
							<div class="comment-depth">
								<div class="comment-profile d-flex">
									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="comment-profile-flag">
										<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>
									</div>
									<div class="comment-name on_cursor align-self-center">Hanulso</div>
									<div class="comment-time align-self-center mx-5">17분전</div>
								</div>
								<div class="comment-content">
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
								</div>
							</div>
							<div class="comment-depth">
								<div class="comment-profile d-flex">
									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="comment-profile-flag">
										<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
									</div>
									<div class="comment-name on_cursor align-self-center">Hanulso</div>
									<div class="comment-time align-self-center mx-5">17분전</div>
								</div>
								<div class="comment-content">
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
								</div>
							</div>
							
							<div class="comment-profile d-flex">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">17분전</div>
								<div class="comment-cocoment align-self-center">답글 달기</div>
							</div>
							<div class="comment-content">
								하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 
							</div>
							<!-- c:if 대댓글 개수가 1 이상이면 -->
							<div class="mt-3 ms-3 on_cursor">
								<i class="bi bi-arrow-return-right fs-5"></i>
								<span class="cocoment-open ms-3">펼치기 / 접기</span>
							</div>
							<div class="comment-depth">
								<div class="comment-profile d-flex">
									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="comment-profile-flag">
										<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
									</div>
									<div class="comment-name on_cursor align-self-center">Hanulso</div>
									<div class="comment-time align-self-center mx-5">17분전</div>
								</div>
								<div class="comment-content">
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
								</div>
							</div>
						</div>
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3">댓글 작성</span>
		                    <button class="msg_send_btn float-end" type="button">
		                       <i class="fa fa-paper-plane-o"  aria-hidden="true"></i>
		                    </button>
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Leave a comment here"></textarea>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- /Modal Test -->

<script type="text/javascript">
	onclick = function deligationFunc(e) {
		let elem = e.target;
		if(elem.getAttribute('data-name') == null){
			elem = null;
			return;
		}
// 		while (!elem.getAttribute('data-name')) {
// 			elem = elem.parentNode;
// 			if (elem.nodeName === 'BODY') {
// 				elem = null;
// 				return;
// 			}
// 		} 

		if (elem.matches('[data-name="heartbeat"]')) {
			console.log("하트");
		} else if (elem.matches('[data-name="bookmark"]')) {
			console.log("북마크");
		} else if (elem.matches('[data-name="share"]')) {
			console.log("공유");
		} else if (elem.matches('[data-name="commentheart"]')) {
			console.log("코멘트하트");
		}
		if (elem.matches('[data-name="more"]')) {
			console.log("더보기");
		}

		elem.classList.toggle('on');
	}
	
	// Side Bar - Hover
	$(".thumb_user").hover(function(){
		$(this).css("background-color", "rgb(204 204 204 / 19%)");
		$(this).children('.msg-link').css("display","block");
	},function(){
		$(this).css("background-color", "#ffffff");
		$(this).children('.msg-link').css("display","none");
	})
	
	// Modal - Detail
	$(".more-comment").on("click", function(){
		$(".modal-background").css("display","block");
	})
	
	$(document).mouseup(function (e){
		var modal = $(".modal-background");
		if( modal.has(e.target).length === 0){
			$(".modal-background").css('display','none');
		}
	});
	
	// 모달 안의 X 버튼에 이벤트를 건다.
	 $('.closeModalBtn').on('click', function(){
		 $('.modal-background').css("display", "none");  
	 });
</script>
<%@ include file="footer.jsp"%>