    //비디오 창 클릭하면 모달창으로 크게 뜨는거
    var content = document.getElementById('content');
    var modal = document.querySelector("#modal");
    content.addEventListener('click',modalHandler);
    function modalHandler(e){
        video_src=e.target.getAttribute("src")
        vid.setAttribute("src" ,video_src)
        modal.style.display="block"
    }
    //x표& sidebar or heade 누르면 모달창 닫힘
    var modal_btn = document.querySelector("#close button");
    var sidebar = document.querySelector("#sidebar");
    var header = document.querySelector("#header");
    var vid = document.getElementById("big_video");

    function modalcloseHandler(){

        modal.style.display="none"
        //modal_btn.style.display="none"
        vid.pause();
    }

    modal_btn.addEventListener('click',modalcloseHandler);
    sidebar.addEventListener('click',modalcloseHandler);
    header.addEventListener('click',modalcloseHandler);
