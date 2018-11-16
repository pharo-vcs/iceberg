running
testRepositoryStatusIsUnknown

	| model status |
	model := IceTipRepositoryModel on: self repository.
	status := model status.
	
	self assert: (status beginsWith: 'Fetch required. Unknown ').
	self assert: (status endsWith: self repository workingCopy referenceCommit shortId).