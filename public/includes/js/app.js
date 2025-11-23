$(document).ready(function () {
    $('#geoBtn').click(function () {
        if (navigator.geolocation) {
            $(this).html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');
            navigator.geolocation.getCurrentPosition(function (position) {
                // Reverse geocoding could be done here, but for now we'll just redirect or handle coords if backend supported it.
                // Since backend expects city name, we might need a reverse geocoding endpoint or just ask user.
                // For this simple version, let's just alert or try to find city via API if we had one.
                // Ideally, we'd send lat/lon to backend.
                alert("Geolocation found: " + position.coords.latitude + ", " + position.coords.longitude + ". Please enter your city manually for now.");
                $('#geoBtn').html('<i class="bi bi-geo-alt"></i>');
            }, function (error) {
                alert("Error getting location: " + error.message);
                $('#geoBtn').html('<i class="bi bi-geo-alt"></i>');
            });
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    });
});
