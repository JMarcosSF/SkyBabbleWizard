# SkyBabbleWizard

-----SUBMISSION NOTES-----
Transaction Message Endpoint POST: 
	http://skybabble.com:8080/proxy/message

examle cURL:

curl -H "Content-Type: application/json" -d '{"userId":"212121","currencyFrom":"EUR","currencyTo":"GBP","amountSell":1000,"amountBuy":747.1,"rate":0.7471,"timePlaced":"24-JAN-15 10:27:44","originatingCountry":"FR"}' http://skybabble.com:8080/proxy/message

Front End URL:
	http://skybabble.com/angular.example/SkyBabble_UI/#/

Public GitHub Repo (2 projects):
	Server-Side:
		https://github.com/JMarcosSF/SkyBabbleWizard.git
	Client-Side:
		https://github.com/JMarcosSF/SkyBabble_UI.git

-----Notes on the Stack Architecture and Implementation-----

I decided to use the DropWizard Framework because the Java Stack was already
conveniently put together. And with Jetty, it was not very troublesome to deploy.

I have composed 5 main components of the stack for this project:

-RabbitMQ
	For a safe, scaleable and reliable message broker which acts as a conduit
	between a User-Facing HTTP Proxy Endpoint and an Internal Message Receiver/RESTful Server to handle requests from the UI
-MongoDB
	Easy and fun to implement. Nice Java API.
-Message Reciever/RESTful Server
	Handles receiving messages from RabbitMQ, and persists to MongoDB.

	Rate Limiting:
	Message processing from RabbitMQ is Rate Limited utilizing Guava libraries (no need to rebuild the Token Bucket wheel).

	Also acts as a RESTful service to handle requests from the UI.
-Proxy
	For this project, I have included the Proxy Server (ENDPOINT) which I would probably
	make as a StandAlone Project. Yet for the sake of readability for the review, I chose
	only to include it with the "Message Receiver/RESTful" Java Project.

	Rate Limiting:
	Handling POST Requests are also rate limited using Guava libs.
-Angular.js
	Took advantage of the templating system, as well as support for REST and AJAX.

***Further Notes On The Stack***
	-Java-Based DropWizard Framework
		-Taking advantage of Jetty, can easily deploy for this example project.
		-Preloaded Java Stack with useful libraries for RESTful, JSON, concurrency, etc.
		-Built in administration management UI and logging.
	-Maven
		-Easily manage libraries, versions and build.
	-MongoDB
		-Works well with DropWizard's libs
		-Easily scalable
		-Works well with Jackson libs and JSON
	-RabbitMQ
		-Reliable Message Broker
		-Reliable deliver of messages
		-Easily manageable
		-Fast and scaleable
	-Apache Server
		-Configurablility
		-Full of features
		-Platform independent. Will work across different environments.
	-Angular.js (client-side/UI)
		-easily manageable code
		-works well w/ AJAX
