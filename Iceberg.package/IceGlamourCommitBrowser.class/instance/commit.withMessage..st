building
commit: entity withMessage: message
	UIManager default informUserDuring: [ :bar | 
		bar label: 'Commiting ', entity printString.
		entity commitWithMessage: message
	]
