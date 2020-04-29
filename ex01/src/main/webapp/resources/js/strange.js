 $(document).ready(function() {
	 $.ajax({
		type: "GET",
		url: "/strange/list",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		success: function( data ){
			console.log("success",data);
			var contentWrap = document.getElementById("content_wrap");
			var frag = document.createDocumentFragment();
			data.forEach(videoObj => {
				frag.appendChild(createVideoListEle(videoObj))
			});

			contentWrap.appendChild(frag);
			
	    },
	    error: function( jqXhr, textStatus, errorThrown ){
	        console.log("error",errorThrown);
	    }
	});
	 
 });
 

// bookmark: false
// category: "original"
// fileName: "sampletest"
// pid: "testvideoid"

//<div class="video">
//    <div class="star_wrap">                       
//        <div class="star"><i class="far fa-star"></i> </div>
//    </div>
//    <video src="/move/sampletest.mp4" autoplay loop muted></video>
//</div>
 
function createVideoListEle(videoObj){
//	console.log("createVideoListEle videoObj :",videoObj);
	let videoEle = document.createElement('div');
	videoEle.className = "video";

	let videoID = videoObj.pid;
	let starHtml = (videoObj.bookmark == false)? `<div class="star" id="${videoID}"><i class="far fa-star"></i> </div>`:`<div class="fill" id="${videoID}"><i class="fas fa-star"></i> </div>`;
	let fileName = videoObj.fileName;
	let htmlStr = 
	`
		<div class="star_wrap">                       
			${starHtml}
		</div>
		<video src="/move/${fileName}" autoplay loop muted></video>
	`

	videoEle.innerHTML=htmlStr;

	let star_wrap = videoEle.querySelector('.star_wrap div');
	//북마크 설정 및 이벤트 처리
	star_wrap.addEventListener('click',function(e){
		console.log("star wrap click");
		console.log("this id : ",this.getAttribute('id'));
		console.log("e.target : ",e.target);
		
		var data = {};
		data.pid = this.getAttribute('id');
		
		//북마크가 안된 상태에서 눌렸을 시
		 if(this.classList.contains('star')){
	        e.target.classList.remove('far');
	        e.target.classList.add("fas");
	        this.classList.add('fill');
	        this.classList.remove('star');
//	        console.log("북마크 하기")
	        data.bookmark = true;
	        updateBookmarkAjax(data);
	    //북마크 된 상태에서 눌렸을 시
        }else if(this.classList.contains('fill')){
            this.classList.remove('fill'); 
            this.classList.add("star");
            e.target.classList.remove('fas');
            e.target.classList.add("far");
//            console.log("북마크 해제")
            data.bookmark = false;
            updateBookmarkAjax(data);
        }
	})
	return videoEle;

}

function updateBookmarkAjax(videoObj){
	
	var csrfEle = document.getElementById('csrfval');

	var csrfName = csrfEle.name;
	var csrfValue = csrfEle.value;
	
	$.ajax({
		type: "POST",
		url: "/strange/bookmark",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		 data: JSON.stringify(videoObj),
//		 data: videoObj,
//		data: data,
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
//			console.log("beforesend : name, vlaue",csrfName,csrfValue);
            xhr.setRequestHeader(csrfName, csrfValue);
        },
		success: function( data ){
			console.log("success",data);
    },
    error: function( jqXhr, textStatus, errorThrown ){
        console.log("error",errorThrown);
    }
	});
	
}

//즐겨찾기 별
//function setBookmarkEvent(){
//	var star_wrap = document.querySelectorAll('#content .video .star_wrap .star')           
//	for (var i=0 ;i<star_wrap.length;i++ ){
//	    star_wrap[i].addEventListener('click', function(e) {
//	        if(this.classList.contains('star')){
//	        e.target.classList.remove('far');
//	        e.target.classList.add("fas");
//	        this.classList.add('fill');
//	        this.classList.remove('star');
//	        console.log(e.target);
//	        console.log(this);
//	        }else if(this.classList.contains('fill')){
//	            this.classList.remove('fill'); 
//	            this.classList.add("star");
//	            e.target.classList.remove('fas');
//	            e.target.classList.add("far");
//	            console.log(e.target);
//	            console.log(this);
//	        }
//	    });
//	}
//}
