actions
commitPackagesWithMessage: text
	text ifNotEmpty: [ 
		pushCheckbox state 
			ifTrue: [ 
				self uiManager informUserDuring: [ :bar | 
					bar label: ('Commiting and uploading changes to {1}' format: {self repository printString}).
					self basicCommitWithMessage: text.
			
					self pushRepository: self repository andThen: [].
					self uiManager inform: ('Uploaded changes to {1}' format: {self repository printString})
				]
			]
			ifFalse: [ 
				self basicCommitWithMessage: text.
			]
	]