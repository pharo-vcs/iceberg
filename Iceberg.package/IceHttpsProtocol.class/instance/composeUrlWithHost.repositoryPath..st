composing
composeUrlWithHost: host repositoryPath: path
	
	^ 'https://{1}/{2}.git' format: { host . path }