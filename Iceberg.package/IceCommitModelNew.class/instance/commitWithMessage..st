actions
commitWithMessage: text
	text ifNotEmpty: [ 
		UIManager default informUserDuring: [ :bar | 
			bar label: ('Commiting to {1}' format: {self repository printString}).
			self repository commitWithMessage: text asString.
			pushCheckbox state ifTrue: [ self repository push ]
		]
	]