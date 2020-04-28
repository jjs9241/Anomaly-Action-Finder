/**
 * 
 */
'use strict';

//const callURI = "http://localhost:5000";
//const pushURI = "http://70.12.229.181:5000";
const pushURI = "http://70.12.50.158:5000";

//const applicationServerPublicKey = "BNbxGYNMhEIi9zrneh7mqV4oUanjLUK3m+mYZBc62frMKrEoMk88r3Lk596T0ck9xlT+aok0fO1KXBLV4+XqxYM=";
//const pushButton = document.querySelector('.js-push-btn');

let isSubscribed = false;
let swRegistration = null;

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

function updateBtn() {
	console.log("updateBtn")
	if (Notification.permission === 'denied') {
		pushButton.textContent = 'Push Messaging Blocked.';
		pushButton.disabled = true;
		updateSubscriptionOnServer(null);
		return;
	}

	if (isSubscribed) {
		pushButton.textContent = 'Disable Push Messaging';
	} else {
		pushButton.textContent = 'Enable Push Messaging';
	}

	pushButton.disabled = false;
}

function updateSubscriptionOnServer(subscription) {
	console.log("updateSubscriptionOnServer")
	// TODO: Send subscription to application server

	const subscriptionJson = document.querySelector('.js-subscription-json');
	const subscriptionDetails =
		document.querySelector('.js-subscription-details');

	if (subscription) {
		subscriptionJson.textContent = JSON.stringify(subscription);
		subscriptionDetails.classList.remove('is-invisible');
	} else {
		subscriptionDetails.classList.add('is-invisible');
	}
}

function subscribeUser() {
	console.log("subscribeUser")
	const applicationServerPublicKey = localStorage.getItem('applicationServerPublicKey');
	const applicationServerKey = urlB64ToUint8Array(applicationServerPublicKey);
	swRegistration.pushManager.subscribe({
			userVisibleOnly: true,
			applicationServerKey: applicationServerKey
		})
		.then(function(subscription) {
			console.log('User is subscribed.');
			console.log("subscription : ",subscription);
//			updateSubscriptionOnServer(subscription);
			localStorage.setItem('sub_token',JSON.stringify(subscription));
			isSubscribed = true;

//			updateBtn();
			sendSubscriptionToken()
		})
		.catch(function(err) {
			console.log('Failed to subscribe the user: ', err);
//			updateBtn();
		});
}

function unsubscribeUser() {
	console.log("unsubscribeUser")
	swRegistration.pushManager.getSubscription()
		.then(function(subscription) {
			if (subscription) {
				return subscription.unsubscribe();
			}
		})
		.catch(function(error) {
			console.log('Error unsubscribing', error);
		})
		.then(function() {
			updateSubscriptionOnServer(null);

			console.log('User is unsubscribed.');
			isSubscribed = false;

			updateBtn();
		});
}

function initializeUI() {
	console.log("initializeUI")

	// Set the initial subscription value
	swRegistration.pushManager.getSubscription()
		.then(function(subscription) {
			console.log("getSubscription subscription: ",subscription)
			isSubscribed = !(subscription === null);

//			updateSubscriptionOnServer(subscription);

			if (isSubscribed) {
				console.log('User IS subscribed.');
			} else {
				console.log('User is NOT subscribed.');
			}
		});
}

if ('serviceWorker' in navigator && 'PushManager' in window) {
	console.log('Service Worker and Push is supported');

	navigator.serviceWorker.register("/resources/js/sw.js")
		.then(function(swReg) {
			console.log('Service Worker is registered', swReg);

			swRegistration = swReg;
			initializeUI();
		})
		.catch(function(error) {
			console.error('Service Worker Error', error);
		});
} else {
	console.warn('Push meapplicationServerPublicKeyssaging is not supported');
	pushButton.textContent = 'Push Not Supported';
}

function push_message() {
	console.log("sub_token", localStorage.getItem('sub_token'));
	$.ajax({
		type: "POST",
		url: pushURI+"/push_v1/",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data: JSON.stringify({'sub_token':localStorage.getItem('sub_token')}),
		success: function( data ){
			console.log("success",data);
    },
    error: function( jqXhr, textStatus, errorThrown ){
        console.log("error",errorThrown);
    }
	});
}

function testBtn(){
	var bell = document.querySelector("#header ul.navbar li i");
	bell.addEventListener('click', function(e){ 
		console.log("bell click")
		push_message()
	});
}

function sendSubscriptionToken(){
	console.log("sendSubscriptionToken");
	$.ajax({
		type: "POST",
		url: pushURI+"/subscription/",
		contentType: 'application/json; charset=utf-8',
		dataType:'json',
		data: JSON.stringify({'subscription_token':localStorage.getItem('sub_token')}),
		success: function( data ){
			console.log("success",data);
    },
    error: function( jqXhr, textStatus, errorThrown ){
        console.log("error",errorThrown);
    }
	});
	
}

$(document).ready(function(){
	console.log("document ready")
	$.ajax({
		type:"GET",
		url:pushURI+'/subscription/',
		success:function(response){
			console.log("response",response);
			localStorage.setItem('applicationServerPublicKey',response.public_key);
			
//			initializeUI()
			subscribeUser();
			testBtn();
		}
	})
});
