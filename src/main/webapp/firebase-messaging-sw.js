var push_url;

// Functional: PUSH

self.addEventListener('push', event => {
	console.log(event.data.text());
	var push_data = eval("(" + event.data.text() + ")");
	push_url = push_data.data.url;
	const title = push_data.notification.title;
	const options = {
	    body: push_data.notification.body,
	    icon: push_data.data.icon,
//	    badge: push_data.data.badge,
	    image: push_data.data.image
	};
	event.waitUntil(self.registration.showNotification(title, options));
});

// Push Notification Click

self.addEventListener('notificationclick', function(event) {	
	console.log('Notification click Received.', push_url);
	event.notification.close();
	if(push_url != null) {
		event.waitUntil(
				clients.openWindow(push_url)
		);	
	}
});



