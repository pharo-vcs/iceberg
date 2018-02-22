accessing
remoteUrl
	^ 'git@bitbucket.org:{1}/{2}.git' format: { self userName. self projectName }