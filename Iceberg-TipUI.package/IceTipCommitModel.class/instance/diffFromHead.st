accessing
diffFromHead
	| diff |
	
	UIManager default 
		informUser: 'Calculating diff'
		during: [ 
			diff := self entity diffFromHead.
			diff build ].
	
	^ IceTipStaticDiffModel
		repositoryModel: self repositoryModel 
		on: diff