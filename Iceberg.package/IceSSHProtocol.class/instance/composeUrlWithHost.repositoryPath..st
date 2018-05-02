url
composeUrlWithHost: host repositoryPath: path
	
	^ 'git@{1}:{2}.git' format: { host . path }