running
testRepositoryStatusIsUnknown

	| model status |
	model := IceTipRepositoryModel on: repository.
	status := model status.
	
	self assert: (status beginsWith: 'Fetch required. Unknown ').
	self assert: (status endsWith: repository workingCopy referenceCommit shortId).