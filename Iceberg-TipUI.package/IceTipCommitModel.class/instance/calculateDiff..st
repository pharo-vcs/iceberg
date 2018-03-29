private
calculateDiff: aBlock
	| diff |
	
	UIManager default 
		informUser: 'Calculating diff'
		during: [ 
			diff := aBlock value.
			diff build ].

	^ diff