accessing
diffFromAncestor
	| diff |
	
	UIManager default 
		informUser: 'Calculating diff'
		during: [ 
			diff := self entity ancestors first diffTo: self entity.
			diff calculateAllElements ].

	^ diff