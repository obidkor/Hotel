<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String date = request.getParameter("date");
String roomstr = request.getParameter("room");
int room = Integer.parseInt(roomstr);
if(roomstr.equals("1")){
	roomstr="Standard Room";
}else if(roomstr.equals("2")){
	roomstr="Deluxe Room";
}else if(roomstr.equals("3")){
	roomstr="Suite Room";
}
out.print(date);
out.print(roomstr);
String sessionok = (String)session.getAttribute("login_id");
%>

<script>
function checkNumber()
{
 var objEv = event.srcElement;
 var num ="{}[]()<>?_|~`!@#$%^&*+\"'\\/ ";    //입력을 막을 특수문자 기재.
 event.returnValue = true;
  
 for (var i=0;i<objEv.value.length;i++)
 {
 if(-1 != num.indexOf(objEv.value.charAt(i)))
 event.returnValue = false;
 }
  
 if (!event.returnValue)
 {
  alert("특수문자는 입력하실 수 없습니다.");
  objEv.value="";
 }
}

$(document).ready(function(){
    $("#paypal").change(function(){
        if($("#paypal").is(":checked")){
            $("#paypalinform1").fadeIn();
            $("#creditinform1").fadeOut();
            $("#creditinform2").fadeOut();
            $("#debitinform1").fadeOut();
            $("#cc-name").removeAttr('required')
            $("#cc-number").removeAttr('required')
            $("#cc-cvv").removeAttr('required')
            $("#cc-expiration").removeAttr('required')
        }
    });
    $("#debit").change(function(){
        if($("#debit").is(":checked")){
        	$("#debitinform1").fadeIn();
            $("#creditinform1").fadeOut();
            $("#creditinform2").fadeOut();
            $("#paypalinform1").fadeOut();
            $("#cc-name").removeAttr('required')
            $("#cc-number").removeAttr('required')
            $("#cc-cvv").removeAttr('required')
            $("#cc-expiration").removeAttr('required')

    }
    });
    $("#credit").change(function(){
        if($("#credit").is(":checked")){
            $("#creditinform1").fadeIn();
            $("#creditinform2").fadeIn();
            $("#debitinform1").fadeOut();
            $("#paypalinform1").fadeOut();
            $("#cc-name").attr('required','true')
            $("#cc-number").attr('required','true')
            $("#cc-cvv").attr('required','true')
            $("#cc-expiration").attr('required','true')
        }
    });
    
});

</script>
<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">

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
    <link href="bootstrap-4.3.1/site/docs/4.3/examples/checkout/form-validation.css" rel="stylesheet">
  </head>
  <body class="bg-light">
    <div class="container">
  <div class="py-5 text-center">
    <img class="d-block mx-auto mb-4" src="upload/Hotelmenu.png" alt="" width="90" height="90">
    <h2><b>결 제 하 기</b></h2>
    <p class="lead">Thank you for visiting Hotel Kjoon</p>
  </div>

  <div class="row">
    <div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Fee</span>
        <span class="badge badge-secondary badge-pill">가격정보</span>
      </h4>
      <ul class="list-group mb-3">
        <%if(roomstr.equals("Standard Room")){%>
        <li class="list-group-item d-flex justify-content-between bg-light">
        <%}else{%> <li class="list-group-item d-flex justify-content-between lh-condensed"><%} %>
          <div>
            <h6 class="my-0">Standard</h6>
            <small class="text-muted">for 3 services</small>
          </div>
          <span class="text-muted">$12,000</span>
        </li>
        <%if(roomstr.equals("Deluxe Room")){%>
        <li class="list-group-item d-flex justify-content-between bg-light">
        <%}else{%> <li class="list-group-item d-flex justify-content-between lh-condensed"><%} %>
          <div>
            <h6 class="my-0">Deluxe</h6>
            <small class="text-muted">for 6 services</small>
          </div>
          <span class="text-muted">$24,000</span>
        </li>
       	<%if(roomstr.equals("Suite Room")){%>
        <li class="list-group-item d-flex justify-content-between bg-light">
        <%}else{%> <li class="list-group-item d-flex justify-content-between lh-condensed"><%} %>
          <div>
            <h6 class="my-0">Suite</h6>
            <small class="text-muted">for 9 services</small>
          </div>
          <span class="text-muted">$99,000</span>
      </ul>

    </div>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Billing address</h4>
      <form class="needs-validation"  method="post" action="?contentPage=D_02write.jsp"  novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">Name<span class="text-muted">(Required)</span></label>
            <input type="text" class="form-control" id="firstName" name="name" placeholder="이름" maxlength="20" onkeyup="checkNumber();" required>
            <div class="invalid-feedback">
              성함을 입력하셔야 합니다.
            </div>
          </div>
           <div class="col-md-6 mb-3">
            <label for="lastName">Date</label>
            <input type="text" class="form-control" id="date" name="date" value="<%=date%>" readonly>
          </div>
        </div>
        
        <div class="mb-3">
          <label for="email">Phone <span class="text-muted">(Required)</span></label>
          <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처" maxlength="20" onkeyup="checkNumber();" required>
          <div class="invalid-feedback">	
            연락처를 적어주세요.
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Address<span class="text-muted">(Required)</span></label>
          <input type="text" class="form-control" id="address" name="address" placeholder="주소" onkeyup="checkNumber();" maxlength="100" required>
          <div class="invalid-feedback">
            주소를 적어주세요.
          </div>
        </div>

        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="zip">Zip<span class="text-muted">(Optional)</span></label>
            <input type="text" class="form-control" id="zip" placeholder="우편번호" onkeyup="checkNumber();">
          </div>
          <div class="col-md-6 mb-3">
            <label for="firstName">Booker Name<span class="text-muted">(Required)</span></label>
            <%if(sessionok==null){%>
            <input type="text" class="form-control" id="bookername" name="bookername" placeholder="예약자 이름"  onkeyup="checkNumber();" maxlength="20" required>
            <%}else{ %>
            <input type="text" class="form-control" id="bookername" name="bookername" value="<%=session.getAttribute("login_nickname")%>" maxlength="20" required readonly>
            <%} %>
            <div class="invalid-feedback">
              예약자 성함을 입력하셔야 합니다.
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <div class="row">
	        <div class="col-md mb">
	        <label for="firstName">Comment<span class="text-muted">(optional)</span></label>
	        <textarea class="form-control" type="text" id="comment" name="comment" placeholder="남기고 싶은 말" onkeyup="checkNumber();" maxlength="200"></textarea>
	        </div>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3">Payment</h4>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="credit">신용카드</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="debit">가상계좌</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" id="paypal" required>
            <label class="custom-control-label" for="paypal">무통장거래</label>
          </div>
        </div>
        
        <!-- display:none part -->
        <div class="row" id="creditinform1" style="display:none">
          <hr>
          <div class="col-md-6 mb-3">
            <label for="cc-name">Name on card</label>
            <input type="text" class="form-control" id="cc-name" name="cc-name" placeholder="" required>
            <small class="text-muted">Full name as displayed on card</small>
            <div class="invalid-feedback">
              Name on card is required
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Credit card number</label>
            <input type="text" class="form-control" id="cc-number" name="cc-number" placeholder="" required>
            <div class="invalid-feedback">
              Credit card number is required
            </div>
          </div>
        </div>
        <div class="row" id="creditinform2" style="display:none">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Expiration</label>
            <input type="text" class="form-control" id="cc-expiration" name="cc-expiration" placeholder="" required>
            <div class="invalid-feedback">
              Expiration date required
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" id="cc-cvv" name = "cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              Security code required
            </div>
          </div>
        </div>
        
        <div class="row" id="debitinform1" style="display:none">
          <div class="col-md mb">
          <hr>
            <strong>신한은행 <%=(int)(Math.random()*19)%>-<%=(int)(Math.random()*9999)%>-<%=(int)(Math.random()*999)%>-<%=(int)(Math.random()*50)%></strong>
          </div>
        </div>
       
        <div class="row" id="paypalinform1" style="display:none">
          <div class="col-md mb">
          <hr>
            <strong>농협 356-0939-1921-34 예금주 김기윤</strong>
            <div class="text-muted">(예약신청일에서 업무일 기준 3일 이내에 입급하셔야 합니다.)</div>
          </div>
        </div>
        
        <hr class="mb-4">
        <input type="hidden" value=<%=date%> id="date" name="date">
        <input type="hidden" value=<%=room%> id="room" name="room">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
      </form>
    </div>
  </div>
</div>
<script src="bootstrap-4.3.1/site/docs/4.3/examples/checkout/form-validation.js"></script>
