<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/carousel/">

 
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="./bootstrap-4.3.1/site/docs/4.3/examples/carousel/carousel.css" rel="stylesheet">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://pix10.agoda.net/hotelImages/2838309/-1/25e29e1c33ec6103ebe20469041d68c7.jpg?s=1024x768">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Hotel Kjoon</h1>
            <p>더 저렴한 요금을 찾으셨다면 해당 가격에 맞춰 드리며 추가 20% 할인 또는 권준 월드 보너스 포인트 5,000점을 제공해 드립니다.</p>
            <p><a class="btn btn-lg btn-primary" href="?contentPage=D_01.jsp" role="button">예약하기</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
      <img src="http://image.downloadwap.co.uk/wallpapers/p2ls/new/37/tb1eCxNe.jpg">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Membership benebits</h1>
            <p>권준 월드 멤버쉽(Kj Owner Club)에 가입하시고 다양한 혜택과 리워드 특전을 누리십시오.</p>
            <p><a class="btn btn-lg btn-primary" href="?contentPage=notopen.jsp" role="button">멤버쉽 신청</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
      <img src="http://www.enaftour.com:8080/tour_good/file/%C5%A9%B7%CE%BD%BA%C8%A3%C5%DA%20%B9%E8%B0%E62_0_0_0.jpg">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>스파 데이 계획</h1>
            <p>다음번 휴가 때는 Kjoon 스파에서 마음껏 호사를 누려 보십시오. 여행을 떠나지 않더라도 근처에서 스파를 즐기실 수도 있습니다.</p>
            <p><a class="btn btn-lg btn-primary" href="?contentPage=A_03.jsp" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
<img width="140" height="140" style="border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px;"src="./upload/Hotelmenu.png" />
        <h2>Hotel Kjoon</h2>
        <p>Hotel Kjoon은 수많은 국빈 방문과 국제행사를 치러내며 'Kjoon그룹을 대표하는 얼굴', '한국을 대표하는 호텔'로서 자부심과 책임감을 가지고 우리나라 서비스 산업의 견인차 역할을 해오고 있습니다.</p>
        <p>&nbsp</p>
        <p><a class="btn btn-secondary" href="?contentPage=A_01.jsp" role="button">호텔 소개 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img width="140" height="140" style="border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px;"src="https://hilton.co.kr/static/upload/hotel_main_20171025171800_lg_sp.jpg" />
        <h2>Urban Lifestyle Hotel</h2>
        <p>현대적 감각과 모던함을 겸비하고 있는 세계 속의 명문호텔 Kjoon호텔은 세계 최고의 어번(Urban) 라이프스타일 호텔로 고객들에게 최고급 Hospitality 서비스를 제공합니다. 한국을 대표하는 호텔의 시설을 미리 둘러보세요.</p>
        <p>&nbsp</p>
        <p><a class="btn btn-secondary" href="?contentPage=C_01.jsp" role="button">시설 보기 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <img width="140" height="140" style="border-radius: 70px;-moz-border-radius: 70px;-khtml-border-radius: 70px;-webkit-border-radius: 70px;"src="https://st.depositphotos.com/1771835/2736/i/950/depositphotos_27368213-stock-photo-woman-customer-service-agent-proffessional.jpg" />
        <h2>고객문의</h2>
        <p>호텔 Kjoon에 문의 할 사항이 있으시면 언제든지 고객게시판에 문의하세요. 24시간 대기하고 있는 문의 담당 직원이 10분안에 답해드립니다. 최고급 호텔에 걸맞는 최고급 서비스를 제공하기위해 언제나 노력하고 있습니다.</p>
        <p>&nbsp</p>
        <p><a class="btn btn-secondary" href="?contentPage=E_01.jsp&bo_table=2" role="button"> 고객 문의 &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->
        <hr class="featurette-divider">
<%
    // 마지막 방문일을 저장하고 있는 쿠키를 저장할 객체
    Cookie lastDate = null;
    
    // 화면에 출력할 메시지를 저장할 문자열 변수
    String msg = "";
    
    // 마지막 방문일을 저장하고 있는 쿠키가 존재하는지를 판별할 변수
    boolean found = false;
    
    // 현재 시간을 저장
    String newValue = "" + System.currentTimeMillis();
    
    // 쿠키를 얻는다.
    Cookie[] cookies = request.getCookies();
    
    // 마지막 방문 일을 정하고 있는 쿠키를 검색
    if (cookies != null) {
        
        for (int i = 0; i < cookies.length; i++) {
            
            lastDate = cookies[i];
            
            if (lastDate.getName().equals("lastdateCookie")) {
                
                found = true;
                break;
            }
        }
    }
    
    // 처음 방문일 경우 새 쿠키 생성
    if (!found) {    // if (found = false)
        
        msg = "처음 방문 입니다......";
    
        // 쿠키 객체를 생성
        lastDate = new Cookie("lastdateCookie", newValue);
        
        // 쿠키 속성값을 설정
        lastDate.setMaxAge(365*24*60*60);    // 365일
        lastDate.setPath("/");
        
        // 쿠키를 추가
        response.addCookie(lastDate);
    }
    
    else {    // 이미 방문한 적이 있는 클라이언트라면
        
        // 이전 방문시간을 알아내어 long형 변수 conv에 저장
        long conv = new Long(lastDate.getValue()).longValue();
    
        // 방문시간을 출력할 수 있도록 msg 변수에 저장
        Date date = new Date(conv);
        String year = date.getYear() + 1900 + "년";
        String month = date.getMonth() + 1 + "월";
        String day = date.getDay() + "일";
        String hour = date.getHours() + "시";
        String minute = date.getMinutes() + "분";
        msg = "당신의 마지막 방문 : " + year + month + day + hour + minute;
        
        // 쿠키에 새 값을 추가
        lastDate.setValue(newValue);
        
        // 쿠키를 추가
        response.addCookie(lastDate);
    }
    out.print(msg + session.getAttribute("login_id"));
%>


    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Standard Room <span class="text-muted">모던의 끝</span></h2>
        <p class="lead">글로벌 럭셔리 호텔 디자이너 피터 왁두코스가 디자인한 '시대를 아우르는 모던함'을 만나 보십시오. 요트 콘셉트로 구성한 프라이빗 바와 고급 침구류와 함께 생애 최고의 휴식을 경험해 보시기 바랍니다..</p>
      </div>
      <div class="col-md-5">
        <img width="500" height="500" src="http://m.shilla.net/images/contents/accmo/PS/R0000000245J_KR.jpg" >
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-1">
        <h2 class="featurette-heading">Deluxe Room <span class="text-muted">어반니어스</span></h2>
        <p class="lead">모던한 분위기의고급스러운 공간으로 여유로은 응접실과 다이닝룸, 업무 공간 및 침실로 구성된 객실입니다.생애 최고의 휴식을 경험해 보세요.</p>
      </div>
      <div class="col-md-5 order-md-3">
        <img width="500" height="500" src="http://m.shilla.net/images/contents/accmo/RS/R000000026AW_KR.jpg" >
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">Suite Room <span class="text-muted">For VVIP</span></h2>
        <p class="lead">고풍스러운 프렌치 디자인의 North Wing 스타일의 객실이며 24시간 전용 버틀러 서비스가 제공됩니다.(09~18시 이용시 무료로 제공됩니다.)</p>
      </div>
      <div class="col-md-5">
        <img width="500" height="500" src="http://m.shilla.net/images/contents/accmo/PRS/R00000001JPV_KR.jpg" >
      </div>
    </div>

    <hr class="featurette-divider">
	
    <!-- /END THE FEATURETTES -->
	
  </div><!-- /.container -->


