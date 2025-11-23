component {

	function configure() {
		
		// coldbox directives
		coldbox = {
			//Application Setup
			appName                  : "Vishubh Weather Forecast",
			eventName                : "event",
			
			//Development Settings
			reinitPassword           : "",
			handlersIndexAutoReload  : true,
			
			//Implicit Events
			defaultEvent             : "Main.index",
			requestStartHandler      : "Main.onRequestStart",
			requestEndHandler        : "",
			applicationStartHandler  : "Main.onAppInit",
			applicationEndHandler    : "",
			sessionStartHandler      : "",
			sessionEndHandler        : "",
			missingTemplateHandler   : "",
			
			//Extension Points
			applicationHelper        : "",
			viewsHelper              : "",
			modulesExternalLocation  : [],
			viewsExternalLocation    : "",
			layoutsExternalLocation  : "",
			handlersExternalLocation : "",
			requestContextDecorator  : "",
			controllerDecorator      : "",
			
			//Error/Exception Handling
			exceptionHandler         : "Main.onException",
			onInvalidEvent           : "",
			customErrorTemplate      : "",
			
			//Application Aspects
			handlerCaching           : false,
			eventCaching             : false,
			viewCaching              : false,
			implicitViews            : false
		};
	
		//Layout Settings
		layoutSettings = {
			defaultLayout : "Main.cfm"
		};
	
		//Interceptor Settings
		interceptorSettings = {
			customInterceptionPoints : ""
		};
	
		//Register interceptors as an array, we need order
		interceptors = [
		];
	
	}

}
