component extends="coldbox.system.EventHandler" {

	public function index( event, rc, prc ) {
		prc.weatherData = {};
		
		if ( event.valueExists( "city" ) ) {
			try {
				var weatherService = getInstance( "WeatherService" );
				prc.weatherData = weatherService.getWeather( rc.city );
			} catch ( any e ) {
				prc.error = e.message;
			}
		}

		event.setView( "main/index" );
	}

	public function onRequestStart( event, rc, prc ) {
		// Global request start logic
	}

	public function onAppInit( event, rc, prc ) {
		// Application initialization logic
	}

	public function onException( event, rc, prc ) {
		event.setHTTPHeader( statusCode = 500 );
		writeOutput( "An error occurred: " & prc.exception.getMessage() & " <br>Detail: " & prc.exception.getDetail() );
	}

}
