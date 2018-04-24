accessing
remoteBranchName
	^ remoteBranchName ifNil: [ remoteBranchName  := 'master' ]