accessing
diffFromFirstAncestor
	| diff ancestorCommit |
	
	ancestorCommit := self entity ancestors 
		ifNotEmpty: #first
		ifEmpty: [ IceNoCommit new ].
	diff := self calculateDiff: [ ancestorCommit diffTo: self entity ].
	^ IceTipCommitDiffModel
		repositoryModel: self repositoryModel 
		on: diff