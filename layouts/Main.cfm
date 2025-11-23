<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Vishubh Weather Forecast</title>
	<link rel="icon" href="/clouds_rain.png" type="image/png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/includes/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100">

	<nav class="navbar navbar-expand-lg mb-4">
		<div class="container">
			<a class="navbar-brand fw-bold" href="/">
				<i class="bi bi-cloud-sun-fill text-warning me-2"></i>Vishubh Weather
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<button class="btn btn-link nav-link" id="themeToggle" title="Toggle Dark/Light Mode">
							<i class="bi bi-moon-stars-fill"></i>
						</button>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container d-flex flex-column justify-content-center flex-grow-1">
		<cfoutput>#renderView()#</cfoutput>
	</div>

	<footer class="text-center mt-auto py-3 text-muted">
		<p>&copy; 2025 Vishubh Weather Forecast</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/includes/js/app.js"></script>
	<script>
		// Theme Toggle Logic
		const themeToggle = document.getElementById('themeToggle');
		const icon = themeToggle.querySelector('i');
		const html = document.documentElement;
		
		// Check local storage
		const currentTheme = localStorage.getItem('theme') || 'light';
		html.setAttribute('data-bs-theme', currentTheme);
		updateIcon(currentTheme);
		
		themeToggle.addEventListener('click', () => {
			const theme = html.getAttribute('data-bs-theme') === 'light' ? 'dark' : 'light';
			html.setAttribute('data-bs-theme', theme);
			localStorage.setItem('theme', theme);
			updateIcon(theme);
		});
		
		function updateIcon(theme) {
			if (theme === 'dark') {
				icon.classList.remove('bi-moon-stars-fill');
				icon.classList.add('bi-sun-fill');
			} else {
				icon.classList.remove('bi-sun-fill');
				icon.classList.add('bi-moon-stars-fill');
			}
		}
	</script>
</body>
</html>
