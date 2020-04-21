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
    a[j].addEventListener('click',AHandler)
}
var active_a;
function AHandler(e){
    if(active_a){
        active_a.classList.remove('active_a');
    }
    this.classList.add('active_a');
    active_a=this;
}


//유저 인포 보여주는 창
var user_icon = document.querySelector("#header .navbar a")
var user_ele = document.querySelector("#header .user_ele")
console.log(user_ele);
//클릭 이벤트 걸어서 로그아웃 엘리먼트 보이게 
user_icon.addEventListener('click',userinfoHandler);
function userinfoHandler() {
    var user_ele = document.querySelector("#header .user_ele");
    if(user_ele.classList.contains('hide')){
        user_ele.classList.remove('hide');
        user_ele.classList.add('show')
    }else{
        user_ele.classList.remove('show');
        user_ele.classList.add('hide')
    }               
} 