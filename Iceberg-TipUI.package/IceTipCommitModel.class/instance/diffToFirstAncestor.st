accessing
diffToFirstAncestor
	| diff ancestorCommit |
	
	ancestorCommit := self entity ancestors 
		ifNotEmpty: #first
		ifEmpty: [ IceNoCommit new ].
	diff := self calculateDiff: [ self entity diffTo: ancestorCommit ].
	^ IceTipCommitDiffModel
		repositoryModel: self repositoryModel 
		on: diff