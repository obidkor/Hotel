/**
 * 
 */
	var orientationEvent; // 모바일 화면 기울이기
	var uAgent=navigator.userAgent.toLowerCase();
	var mobilePhones='android';
	if(uAgent.indexOf(mobilePhones)!=-1){
		orientationEvent="resize";  //안드로이드는 resize로 들어옴
	}else{//아이폰은 이렇게 들어옴
		orientationEvent="orientationchange";
		window.addEventListener(orientationEvent, function(){
			location.reload();
		},false)
	}

	var prevScreen=0; // 뒤로가기 변수
	var sv_prevScreen=0; // 
	
	
	function prevShow(){//뒤로가기 함수
		ScreenShow(prevScreen); // 
		
	}
	
//	서브메뉴를 선택(하단버튼누름)했을때 함수
	var muCnt=5;//서브메뉴
	var scCnt = 14;//화면
	function fncShow(pos){
		var i=0;

		//모든 일반화면은 막는다
		for(i=0; i<scCnt; i++){
			var obj= document.getElementById("s"+i);
			obj.style.display = 'none';
		}
		//메뉴선택에 따라 중간메뉴 div는 보여주고, 누른 버튼의 배경을 바꿔준다.
		for(i=0; i<muCnt; i++){
			var obj = document.getElementById("menu"+i);
			var obj2 = document.getElementById("m"+i);

			if(i==pos){
				obj.style.display="";
				obj2.style.background='#ff0000';
			}else{
				obj.style.display="none";
				obj2.style.background="#ffff00";
			}
		}
	}

//	화면은 총 14개이고 화면이 선택된 번호에 따라 화면을 보여주는 함수
	var scCnt =14;
	var ScrObj;
	
	var timer1;
	function ScrAnimation(){//왼쪽에서오른족으로 미끄러지는 애니매이션
		var offset= -50;
		if(parseInt(ScrObj.style.left)>10){
			ScrObj.style.left=parseInt(ScrObj.style.left)+offset+"px";
			timer1 = setTimeout("ScrAnimation()",1);
		}else{
			ScrObj.style.left = 5;
			clearTimeout(timer1)
		}
	}
	
	
	function ScreenShow(pos){
		var i = 0;
		//모든 메뉴화면은 막는다
		for(i=0; i<muCnt; i++){
			var obj= document.getElementById("menu"+i);
			obj.style.display = 'none';
		}
		//선택된 화면번호의 화면만 보여준다
		for(i=0; i<scCnt; i++){
			var obj = document.getElementById("s"+i);

			if(i==pos){
				prevScreen = sv_prevScreen; // i가 증가하면서
				sv_prevScreen=i; // 전 화면과 현 화면이 나뉨
				
				obj.style.display='';
				
				obj.style.position="relative";
				obj.style.top=35;
				obj.style.left=screen.width;
				obj.style.height=screen.hegiht-120;
				
				ScrObj=obj;
				ScrAnimation();
			}else{
				obj.style.display='none';
			}
		}

	}
