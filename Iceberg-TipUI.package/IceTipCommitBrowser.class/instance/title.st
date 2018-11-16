accessing
title
	^ 'Commit on {1} branch {2}' format: { 
		self model name. 
		self model branchName } 