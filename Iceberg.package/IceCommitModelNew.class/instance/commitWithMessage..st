actions
commitWithMessage: text
	text ifNotEmpty: [ 
		self uiManager informUserDuring: [ :bar | 
			bar label: ('Commiting to {1}' format: {self repository printString}).
			self repository commitWithMessage: text asString.
			
			pushCheckbox state ifTrue: [ 
				self pushRepository: self repository andThen: []]
		].
	
		self message text: ''.
		self uiManager inform: ('Commited with message: ', text)
	]
