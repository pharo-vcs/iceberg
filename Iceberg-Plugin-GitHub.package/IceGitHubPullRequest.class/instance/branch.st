accessing
branch
	fetched ifFalse: [ self fetch ].
	^ branch ifNil: [
		branch := (self repository
			remoteNamed: self remote name )
				remoteBranchNamed: ((self jsonAt: #head) at: #ref) ]