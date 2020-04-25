//CCTV리스트로 리다이렉트
var gotocctvlist =document.getElementById('gotocctvlist');
gotocctvlist.addEventListener("click", gotocctvHandler);
function gotocctvHandler(){
    location.href="/cctvs"
}