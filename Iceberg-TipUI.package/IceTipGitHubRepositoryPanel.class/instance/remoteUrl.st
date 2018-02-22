accessing
remoteUrl
	^ 'git@github.com:{1}/{2}.git' format: { self userName. self projectName }