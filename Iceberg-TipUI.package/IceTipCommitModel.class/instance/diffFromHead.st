accessing
diffFromHead
	| head diff |
	
	head := self repositoryModel entity headCommit.
	diff := self calculateDiff: [ head diffTo: self entity ].
	^ IceTipCommitDiffModel
		repositoryModel: self repositoryModel 
		on: diff