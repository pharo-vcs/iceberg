accessing
remoteUrl
	^ 'git@gitlab.com:{1}/{2}.git' format: { self userName. self projectName }