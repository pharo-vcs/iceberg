private-commits
commitPackage: aMCPackage author: authorString message: messageString ancestors: ancestors dependencies: dependencies inInternalRepository: aRepository 
	
	| newCommit |
	newCommit := MCVersion new
		setPackage: aMCPackage
		info: (MCVersionInfo
			name: aMCPackage name
			id: UUID new
			message: messageString
			date: Date today
			time: Time now
			author: authorString
			ancestors: ancestors)
		snapshot: aMCPackage snapshot
		dependencies: dependencies.
	aRepository storeVersion: newCommit.
	^ newCommit