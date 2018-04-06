accessing
title
	^ 'Push {1}/{2} to {3}' format: { 
		self model repositoryName.
		self model branchName. 
		self model remoteName }