accessing
diffFromFirstAncestor
	| diff ancestorCommit |
	
	ancestorCommit := self entity ancestors 
		ifNotEmpty: #first
		ifEmpty: [ IceNoCommit new ].
	UIManager default 
		informUser: 'Calculating diff'
		during: [ 
			diff := ancestorCommit diffTo: self entity.
			diff build ].

	^ IceTipStaticDiffModel
		repositoryModel: self repositoryModel 
		on: diff