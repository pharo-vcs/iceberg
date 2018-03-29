api
title
	^ 'Preview merge of {1}/{2}' format: { 
		self model repositoryName.
		self model targetName }