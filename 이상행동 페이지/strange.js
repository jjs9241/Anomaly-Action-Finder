//즐겨찾기 별
var star_wrap = document.querySelectorAll('#content .video .star_wrap .star')           
for (var i=0 ;i<star_wrap.length;i++ ){
    star_wrap[i].addEventListener('click', function(e) {
        if(this.classList.contains('star')){
        e.target.classList.remove('far');
        e.target.classList.add("fas");
        this.classList.add('fill');
        this.classList.remove('star');
        console.log(e.target);
        console.log(this);
        }else if(this.classList.contains('fill')){
            this.classList.remove('fill'); 
            this.classList.add("star");
            e.target.classList.remove('fas');
            e.target.classList.add("far");
            console.log(e.target);
            console.log(this);
        }
    });
}