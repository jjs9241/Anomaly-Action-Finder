/**
 * 
 */
function urlB64ToUint8Array(base64String) {
  const padding = '='.repeat((4 - base64String.length % 4) % 4);
  const base64 = (base64String + padding)
    .replace(/\-/g, '+')
    .replace(/_/g, '/');

  const rawData = window.atob(base64);
  const outputArray = new Uint8Array(rawData.length);

  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
}

self.addEventListener("message", function(event) {
	console.log("message 내부")
    event.source.postMessage("Responding to " + event.data);
});

self.addEventListener('push', function(event) {
  console.log('[Service Worker] Push Received.');
  console.log(`[Service Worker] Push had this data: "${event.data.text()}"`);

//  var pushText = document.getElementById('push_text');
//  pushText.textContent = "asdfafs";
//  pushText.textContent = "${event.data.text()}";
  console.log("event : ",event)
  console.log("self : ",self)
//  event.source.postMessage("Responding to " + event.data);
  
  const title = 'Finder';
  const options = {
    body: `"${event.data.text()}"`,
    icon: 'images/icon.png',
    badge: 'images/badge.png'
  };
  
  noticeToWeb("push test dd")

  event.waitUntil(self.registration.showNotification(title, options));
});

function noticeToWeb(message){
	
//	return fetch('http://70.12.229.181:8080/noticetoweb?message='+message,{
	return fetch('http://localhost:8080/noticetoweb?message='+message,{
		method: 'GET',
//		mode:'cors',
		cache: 'no-cache',
//		credential
		headers:{
			'Content-Type': 'application/json',
            // 'Content-Type': 'application/x-www-form-urlencoded',
		},
		referrer: 'no-referrer'
//		referrer: 'referrer'
//		body:JSON.stringify(jsonData)
	})
}

//푸쉬 알람 메시지 클릭 시 트리거 되는 이벤트 처리
self.addEventListener('notificationclick', function(event) {
  console.log('[Service Worker] Notification click Received.');

  //알림 메시지 닫기
  event.notification.close();

  event.waitUntil(
//    clients.openWindow('https://developers.google.com/web/')
    clients.openWindow('/strange')
  );
});

self.addEventListener('pushsubscriptionchange', function(event) {
  console.log('[Service Worker]: \'pushsubscriptionchange\' event fired.');
  const applicationServerPublicKey = localStorage.getItem('applicationServerPublicKey');
  const applicationServerKey = urlB64ToUint8Array(applicationServerPublicKey);
  event.waitUntil(
    self.registration.pushManager.subscribe({
      userVisibleOnly: true,
      applicationServerKey: applicationServerKey
    })
    .then(function(newSubscription) {
      // TODO: Send to application server
      console.log('[Service Worker] New subscription: ', newSubscription);
    })
  );
});
