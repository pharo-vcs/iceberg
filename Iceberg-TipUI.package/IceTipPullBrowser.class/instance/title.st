accessing
title
	^ 'Pull {1} from {2}' format: { 
		self model repositoryName. 
		self model remoteName }