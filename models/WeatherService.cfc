component {

	public function getWeather( required string city ) {
		// 1. Geocoding
		var geoUrl = "https://geocoding-api.open-meteo.com/v1/search?name=#urlEncodedFormat( arguments.city )#&count=1&language=en&format=json";
		
		cfhttp( url=geoUrl, method="get", result="geoResult" );
		
		if ( geoResult.status_code != 200 ) {
			throw( "Geocoding API failed" );
		}
		
		var geoData = deserializeJSON( geoResult.filecontent );
		
		if ( !structKeyExists( geoData, "results" ) || arrayIsEmpty( geoData.results ) ) {
			throw( "City not found" );
		}
		
		var lat = geoData.results[ 1 ].latitude;
		var lon = geoData.results[ 1 ].longitude;
		var cityName = geoData.results[ 1 ].name;
		
		// 2. Weather Data
		var weatherUrl = "https://api.open-meteo.com/v1/forecast?latitude=#lat#&longitude=#lon#&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_sum,rain_sum,showers_sum,snowfall_sum,precipitation_hours,precipitation_probability_max,wind_speed_10m_max,wind_gusts_10m_max,wind_direction_10m_dominant&timezone=auto";
		
		cfhttp( url=weatherUrl, method="get", result="weatherResult" );
		
		if ( weatherResult.status_code != 200 ) {
			throw( "Weather API failed" );
		}
		
		var weatherData = deserializeJSON( weatherResult.filecontent );
		weatherData.city = cityName;
		
		return weatherData;
	}

}
