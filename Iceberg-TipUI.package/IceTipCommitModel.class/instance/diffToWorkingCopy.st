accessing
diffToWorkingCopy
	| diff |
	diff := self calculateDiff: [ self entity diffToWorkingCopy ].
	^ IceTipCommitDiffModel
		repositoryModel: self repositoryModel 
		on: diff