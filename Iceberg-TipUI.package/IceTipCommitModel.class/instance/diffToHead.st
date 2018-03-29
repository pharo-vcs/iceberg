accessing
diffToHead
	| head diff |
	
	head := self repositoryModel entity headCommit.
	diff := self calculateDiff: [ self entity diffTo: head ].
	^ IceTipCommitDiffModel
		repositoryModel: self repositoryModel 
		on: diff