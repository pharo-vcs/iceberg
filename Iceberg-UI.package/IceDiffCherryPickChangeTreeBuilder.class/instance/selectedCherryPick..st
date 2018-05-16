accessing
selectedCherryPick: aSet
	cherryPickBlock ifNil: [ ^ self ].
	cherryPickBlock value: aSet