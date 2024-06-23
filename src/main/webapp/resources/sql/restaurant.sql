DROP TABLE restaurant;

CREATE TABLE IF NOT EXISTS restaurant(
   r_id VARCHAR(10) NOT NULL,
   r_name VARCHAR(20),
   r_category VARCHAR(20),
   r_scrapCount INTEGER,
   r_address TEXT,
   r_description TEXT,
   r_unitPrice INTEGER,
   r_fileName VARCHAR(20),
   PRIMARY KEY (r_id)
) DEFAULT CHARSET=utf8;

INSERT INTO restaurant VALUES('KFOOD001', '가장 맛있는 족발', '한식', 0, '서울 성북구 길음로15가길 3 지1층', '맛집 랭킹1위 가장맛있는족발(서울지역 우수매장 1위)정릉점 입니다. 17시이전 주문시 컵라면(김치사발면)증정, 찜+리뷰+별5+닉네임+가장맛있는족발정릉점 주먹밥 서비스 입니다. 현금결제시 콜라 500ml 사이즈업up', 40000, '가장맛있는족발.jpg');
INSERT INTO restaurant VALUES('WFOOD001', '롤링 파스타', '양식', 0, '서울 성북구 동소문로22길 5', '집에서 즐기는 롤링파스타!! TAKE - OUT 포장가능!! 배달도 가능합니다!! 배달의 민족 또는 전화주문 언제든지 부탁드릴께요!', 8000, '롤링파스타.jpg');
INSERT INTO restaurant VALUES('JFOOD001', '김태완 스시', '일식', 0, '서울 성북구 동소문로20길 32 1층', '저희 김태완 스시는 모든 손님분들의 건강과 안전을 위하여 일본산 생선을 절대로 사용하지 않습니다. 늘 위생적인 음식과 안전하고 건강한 음식을 생각하고, 만드는 김태완 스시 되도록 노력하겠습니다.', 20000, '김태완스시.jpg');
INSERT INTO restaurant VALUES('CFOOD001', '짬뽕 선수', '중식', 0, '서울 성북구 동소문로20가길 2 2층', '짬뽕선수 영수증 리뷰 이벤트 진행합니다! 네이버 영수증 리뷰 작성 후 서비스 받아가세요! 군만두 반접시 or 시원한 음료수 서비스 제공합니다', 10000, '짬뽕선수.jpg');
INSERT INTO restaurant VALUES('FFOOD001', '신전 떡볶이', '분식', 0, '서울 성북구 동소문로20다길 24 1층', '8,000원이상 구매시 영화티켓 4500원 30,000원 결제 후 영수증리뷰 작성시 1매 증정', 4000, '신전떡볶이.jpg');
INSERT INTO restaurant VALUES('CFOOD002', '보배반점 광주상무점', '중식', 0, '광주 서구 치평로 80 1층', '저희 보배반점 광주상무점은 매일매일 신선한 고기와 야채 해산물을 가지고 요리하며, 주문 즉시 요리를 만들어 불 맛이 살아있는 중화요리 특유의 감칠맛을 느낄 수 있는 점이 특징입니다.', 10000, '보배반점 광주상무점.jpeg');
INSERT INTO restaurant VALUES('KFOOD002', '바다드림', '한식', 0, '인천 중구 잠진도길 46 바다드림', '싱싱한 생물조개와 야채 그리고 싱싱한 생물 전복으로 우린 육수에 살아있는 산낙지를 직접 넣어주는 산낙지전복샤브, 산낙지전복볶음, 조개찜, 조개구이 , 회, 해물칼국수, 새우파전, 왕새우튀김, 돈가스등 산낙지와 조개등 싱싱한 해산물 음식이 맛있는 그곳!', 30000, '바다드림.png');
INSERT INTO restaurant VALUES('KFOOD003', '수변최고돼지국밥집 민락본점', '한식', 0, '부산 수영구 광안해변로370번길 9-32', '늘 신선한 식재료와 오랜 기간의 조리 노하우로 따뜻하고 맛있는 국밥으로 보답하겠습니다!', 10000, '수변최고돼지국밥.jpeg');
INSERT INTO restaurant VALUES('WFOOD002', '아티코', '양식', 0, '대구 수성구 지범로 43-12', 'ATTICO는 이탈리아어로 낮은 이층 또는 간소해서 우아한이라는 뜻을 담고 있으며, 오너셰프는 2009년 양식조리 기능사 자격증을 취득 후, 세계 3대 요리학교 중 두 곳인 Le Cordon Bleu에서 Cuisine을 졸업하고 Tsuji에서 Dessert를 수료한 뒤, 다양한 레스토랑과 호텔에서 근무 후 2018년 오픈한 이탈리안 레스토랑입니다.', 40000, '아티코.jpeg');

SELECT * FROM restaurant;

DESC restaurant;