<cfsetting enablecfoutputonly="true">
<cfoutput>
<div class="row justify-content-center">
	<div class="col-md-8">
		<div class="card shadow-sm">
			<div class="card-body">
				<h2 class="card-title text-center mb-4 text-primary">Vishubh Weather Forecast</h2>
				
				<form action="/" method="get" class="mb-4">
					<div class="input-group">
						<input type="text" name="city" class="form-control" placeholder="Enter city name..." value="#encodeForHTMLAttribute( rc.city ?: '' )#" required>
						<button class="btn btn-primary" type="submit">Search</button>
						<button class="btn btn-secondary" type="button" id="geoBtn" title="Use my location"><i class="bi bi-geo-alt"></i></button>
					</div>
				</form>

				<cfif structKeyExists( prc, "error" )>
					<div class="alert alert-danger">
						#prc.error#
					</div>
				</cfif>

			</div>
		</div>

		<cfif structKeyExists( prc, "weatherData" ) && !structIsEmpty( prc.weatherData )>
			<cfscript>
				function getWeatherIcon( code ) {
					switch( code ) {
						case 0: return "bi-sun";
						case 1: case 2: case 3: return "bi-cloud-sun";
						case 45: case 48: return "bi-cloud-fog";
						case 51: case 53: case 55: return "bi-cloud-drizzle";
						case 61: case 63: case 65: return "bi-cloud-rain";
						case 71: case 73: case 75: return "bi-cloud-snow";
						case 80: case 81: case 82: return "bi-cloud-rain-heavy";
						case 95: case 96: case 99: return "bi-cloud-lightning-rain";
						default: return "bi-cloud";
					}
				}
			</cfscript>
			
			<div class="card shadow-sm mt-4">
				<div class="card-body">
					<div class="text-center mb-4">
						<h3>#prc.weatherData.city#</h3>
						<div class="display-1">
							<i class="bi #getWeatherIcon( prc.weatherData.current.weather_code )#"></i>
							#prc.weatherData.current.temperature_2m#&deg;C
						</div>
						<p class="text-muted">Wind: #prc.weatherData.current.wind_speed_10m# km/h</p>
					</div>

					<h4 class="mb-3">7-Day Forecast</h4>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Date</th>
									<th>Condition</th>
									<th>Max</th>
									<th>Min</th>
									<th>Rain</th>
								</tr>
							</thead>
							<tbody>
								<cfloop array="#prc.weatherData.daily.time#" index="i" item="date">
									<tr>
										<td>#dateFormat( date, "medium" )#</td>
										<td><i class="bi #getWeatherIcon( prc.weatherData.daily.weather_code[ i ] )#"></i></td>
										<td>#prc.weatherData.daily.temperature_2m_max[ i ]#&deg;C</td>
										<td>#prc.weatherData.daily.temperature_2m_min[ i ]#&deg;C</td>
										<td>#prc.weatherData.daily.precipitation_sum[ i ]# mm</td>
									</tr>
								</cfloop>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</cfif>
	</div>
</div>
</cfoutput>
<cfsetting enablecfoutputonly="false">
