patches
httpsURL
	^ 'https://{1}/{2}.git' format: { self host . self projectPath }
