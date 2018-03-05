accessing
diffFromAncestor
	| diff ancestorDiff |
	
	ancestorDiff := self entity ancestors 
		ifNotEmpty: #first
		ifEmpty: [ IceNoCommit new ].
	UIManager default 
		informUser: 'Calculating diff'
		during: [ 
			diff := ancestorDiff diffTo: self entity.
			diff build ].

	^ IceTipStaticDiffModel for: diff