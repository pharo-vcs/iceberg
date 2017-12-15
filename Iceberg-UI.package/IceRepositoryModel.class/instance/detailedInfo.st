accessing
detailedInfo
	^ 	self repository origin detailedInfo, { 
		'Location' -> self repository location pathString. 
		'Pulling from' -> (self repository pullRemote name). 
		'Pushing to' -> (self repository pushRemote name).
		'On branch' -> self repository branchName.
	}