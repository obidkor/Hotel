
<%@page import="Item.ReserveItem"%>
<%@page import="Dao.ReserveDao"%>
<%@page import="Service.ReserveItemServiceImple"%>
<%@page import="Service.ReserveItemService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
//AJAX select box
function roomSelect(obj){
	var $target = $("select[name='room']");
	   
	$target.empty();
	   if(date == "") {
	      $target.append("<option value=''>시스템오류(토큰에러)</option>");
	      return;
	   }
	   
	
	$.ajax({

	      url : "/Hotel/admin/availroomjson.jsp",
	      type : "post", //get post둘중하나
		  data : {},
	      success : function(data) {
	    	
	         var str = JSON.parse(data);//JSon 파싱
	         
	         var book = str.dates;
			 var count=0;
	         if(book.length == 0) {
	             $target.append("<option value=''>시스템오류</option>");
	          } else {
	             for(var i = 0; i < book.length; i ++) {
	                if(book[i].date == obj) {//파싱데이터처리
	                	count=0;
	                	if(book[i].Suite=="예약가능"){$target.append("<option value='" + 3 + "'>Suite " + book[i].Suite + "</option>");count++;}
	                	if(book[i].Deluxe=="예약가능"){$target.append("<option value='" + 2 + "'>Deluxe " + book[i].Deluxe + "</option>");count++;}
	                	if(book[i].Standard=="예약가능"){$target.append("<option value='" + 1 + "'>Standard " + book[i].Standard + "</option>");count++;}
						if(count==0)                	{$target.append("<option value=''>예약불가</option>");}
	     				
	                }
	             };
	          }



	      },
	      error: function(xhr) {
	         console.log(xhr.responseText);
	         return;
	      }
	   });

	 
};
</script>
<%

String date2 = request.getParameter("date");
String room1 = request.getParameter("room");
int room = Integer.parseInt(room1);

out.print(date2);out.print(room1);
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Calendar cl = Calendar.getInstance();
String checkdate =""; 
Date date1 = format.parse(date2);
java.sql.Date date = new java.sql.Date(date1.getTime());
ReserveItemService ser = new ReserveItemServiceImple();
ReserveItem re = ReserveDao.getRecordOne(date, room);

%>
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
    <h2>관리자 예약상황 수정</h2>
  </div>

    <div class="col-md order-md">
      <h4 class="mb-3">Billing address</h4>
      <form class="needs-validation" method="post" action="?contentPage=admin/D_02updatewrite.jsp" novalidate>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">숙박자 이름</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="" value="<%=re.getName()%>" onkeyup="checkNumber();" required>
            <div class="invalid-feedback">
              숙박자의 이름이 필요합니다.
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">예약자 이름</label>
            <input type="text" class="form-control" id="bookername" name="bookername" placeholder="" value="<%=re.getIn_name() %>" onkeyup="checkNumber();" required>
            <div class="invalid-feedback">
              예약자의 이름이 필요합니다.
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="address" name ="address" placeholder="" value="<%=re.getAddr() %>" maxlength="50" onkeyup="checkNumber();" required>
          <div class="invalid-feedback">
            주소를 적어주세요.
          </div>
        </div>
        
         <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="phone" name ="phone" placeholder="" value="<%=re.getTelNum() %>" maxlength="20" onkeyup="checkNumber();" required>
          <div class="invalid-feedback">
            전화번호를 적어주세요.
          </div>
        </div>
        
         <div class="mb-3">
          <label for="address">Address</label>
          <input type="text" class="form-control" id="comment" name ="comment" placeholder="" value="<%=re.getComment()%>" maxlength="100" onkeyup="checkNumber();"  required>
          <div class="invalid-feedback">
            코멘트를 적어주세요.
          </div>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">날짜</label>
			 <select class="custom-select d-block w-100" id="date" name="date" onchange="roomSelect(this.value);">                                                     
			    <%for(int i=0;i<30;i++){
			    	checkdate=format.format(cl.getTime());
			    	if(date2.equals(checkdate)){
			    		%><option value="<%=checkdate%>" selected><%=checkdate%></option><%		
			    	}else{
			    		%><option value="<%=checkdate%>"><%=checkdate%></option><%
			    	}
			    	cl.add(Calendar.DATE,+1);
			    } %>                          
			    </select>
            <div class="invalid-feedback">
              Please select a valid Date.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">Room</label>
			    <select class="custom-select d-block w-100" id="room" name="room">
				    <option value="<%=room%>"><%
				    if(room==1) out.print("Standard");
				    else if(room==2) out.print("Deluxe");
				    else if(room==3) out.print("Suite");
				    %></option>
			    </select>             
            <div class="invalid-feedback">
              Please provide a valid room.
            </div>
          </div>
       	<div class="col-md-3 mb-3">
            <label for="state">진행상황</label>
			    <select class="custom-select d-block w-100" id="processing" name="processing">
				    <option value="1">예약신청</option>
				    <option value="2">입금완료</option>
				    <option value="3">환불요청</option>
				    <option value="4">환불완료</option>
			    </select>             
            <div class="invalid-feedback">
              Please provide a valid processing.
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <input type="hidden" value="<%=date2 %>" name="dateformer" id="dateformer">
        <input type="hidden" value="<%=room1%>" name="roomformer" id="roomformer">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
      </form>
    </div>
  </div>

 
        <script src="bootstrap-4.3.1/site/docs/4.3/examples/checkout/form-validation.js"></script>