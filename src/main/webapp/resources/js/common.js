//ul태그에 이벤트 걸고 클릭했을떄 active클래스 넣어서 블루로 만들기
//요소들 마우스 후버시 파랑색으로 변경
var ul = document.getElementsByTagName('ul');
for(var i=0 ;i<ul.length;i++){
	ul[i].addEventListener('click', clickHandler)
	}
	var currentimg;
	function clickHandler(e) {
	if(currentimg){
	    currentimg.classList.remove('active');
	}
	var title = this.getElementsByTagName('li')[0];
	title.classList.add('active');
	currentimg=title;
	}
	
	//a링크 클릭시 두껍게 만들기
	var a = document.querySelectorAll("#sidebar ul li a");
	for(var j=0;j<a.length;j++){
	    a[j].addEventListener('click',AHandler);
	}
	var active_a;
	function AHandler(e){
	    if(active_a){
	        active_a.classList.remove('active_a');
	    }
	    this.classList.add('active_a');
	    active_a=this;
	}