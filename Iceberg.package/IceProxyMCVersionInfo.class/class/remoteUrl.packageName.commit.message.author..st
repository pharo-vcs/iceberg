instance creation
remoteUrl: anUrl packageName: aName commit: aCommit message: aString author: authorString
	^ self 
		remoteUrl: anUrl
		packageName: aName 
		commitId: aCommit id
		stub: (MCVersionInfo
			name: aName
			id: UUID new
			message: aString
			date: aCommit datetime asDate
			time: aCommit datetime asTime
			author: authorString
			ancestors: #())