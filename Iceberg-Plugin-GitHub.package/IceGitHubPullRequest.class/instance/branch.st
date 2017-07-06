accessing
branch
	fetched ifFalse: [ self fetch ].
	^ branch ifNil: [
		branch := IceRemoteBranch
			remoteName: self remote remoteName 
			branchName: ((self jsonAt: #head) at: #ref)
			inRepository: self repository.
		branch ]