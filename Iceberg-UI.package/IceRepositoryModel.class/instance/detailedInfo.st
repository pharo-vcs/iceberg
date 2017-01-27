accessing
detailedInfo
	^ 	self repository origin detailedInfo, { 
		'Location' -> self repository location pathString. 
		'Pulling from' -> self repository pullRemote remoteName. 
		'Pushing to' -> self repository pushRemote remoteName.
	} 
