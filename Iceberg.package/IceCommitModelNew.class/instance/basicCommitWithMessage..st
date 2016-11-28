private
basicCommitWithMessage: text
	self uiManager informUserDuring: [ :bar | 
		bar label: ('Commiting to {1}' format: {self repository printString}).
		self repository commit: self model withMessage: text asString.
		self message text: ''.
		self uiManager inform: ('Commited with message ', text)
	]