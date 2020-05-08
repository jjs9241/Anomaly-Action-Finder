/**
 * 
 */

//const pushURI = "http://70.12.50.158:5000";

 $(document).ready(function() {
	 var pushURI = "http://70.12.50.158:5000";
	 
	 //socket의 namespace
	 //connect URL format : http[s]://<domain>:<port>[/<namespace>]
	 console.log("webSocket_finder.js    pushURI : ",pushURI);
	 socket_domain = pushURI;
	 socket_port = '5000';
//	 socket_namespace="/userid";
	 socket_namespace="/test";
	 
	 socket_URL = pushURI+socket_namespace;
	 console.log("webSocket_finder.js   socket_URL : ",socket_URL);
	 
	 var socket = io(socket_URL);
	 
	 //소켓 연결하기
	 socket.on('connect',function(){
		 socket.emit('my_event',{data: 'finder socket test'});
	 });
	 
	 
	 //이상행동 디텍트 되면 알림 알려주기
	 socket.on('strange_detected',function(msg, cb){
		 //function의 파라미터는 서버에서 보내는 데이터의 수만큼 있다.
		 console.log("msg : ",msg);
		 console.log("cb : ",cb);
//		 noticeAlarmToBell();
	 });
	 
	 //bell 알림 설정하기
	 function noticeAlarmToBell(){
		 var bell = document.querySelector("#header ul.navbar li i");
		 setBellAlarm(bell);
	 }
	 
	 //bell 알림 이이콘 및 숫자 제거
	 function removeBellAlarm(bell){
		bell.classList.remove("fas");
        bell.classList.add("far");
        var bell_num_cont= document.querySelector("#header ul.navbar li.notice div");
        notice.removeChild(bell_num_cont);
	 }
	 
	 //bell 알림 아이콘 및 숫자 설정
	 function setBellAlarm(bell){
		removeBellAlarm(bell);
		bell.classList.remove("far");
		bell.classList.add("fas");
		var bell_num_cont= document.createElement("div");
		var bell_num = document.createTextNode("N");
		bell_num_cont.appendChild(bell_num);
		notice.appendChild(bell_num_cont);
	 }
	 
 });