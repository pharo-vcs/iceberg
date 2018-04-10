accessing
title
	^ 'Preview checkout of {1}/{2}' format: { 
		self model repositoryName.
		self model targetName }