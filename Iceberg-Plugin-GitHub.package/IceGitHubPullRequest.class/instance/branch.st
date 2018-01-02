accessing
branch
	fetched ifFalse: [ self fetch ].
	^ branch ifNil: [
		branch := IceOldRemoteBranch
			remoteName: self remote remoteName 
			branchName: ((self jsonAt: #head) at: #ref)
			inRepository: self repository.
		branch ]