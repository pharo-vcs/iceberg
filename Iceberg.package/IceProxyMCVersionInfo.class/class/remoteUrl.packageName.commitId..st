instance creation
remoteUrl: urlString packageName: nameString commitId: idString
	^ self new 
		remoteUrl: urlString 
		packageName: nameString 
		commitId: idString
		stub: nil