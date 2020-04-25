//store 리스트로 리다이렉트
var gotostorelist =document.getElementById('gotostorelist');
gotostorelist.addEventListener("click", gotostoreHandler);
function gotostoreHandler(){
    location.href="/stores"
}