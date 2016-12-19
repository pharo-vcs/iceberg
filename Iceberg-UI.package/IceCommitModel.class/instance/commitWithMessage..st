actions
commitWithMessage: text
	text ifNotEmpty: [ 
		pushCheckbox state 
			ifTrue: [ 
				UIManager default informUserDuring: [ :bar | | remote |
					remote := self repository pushRemote.
					bar label: ('Commiting and uploading changes to {1}' format: {remote}).
					self basicCommitWithMessage: text.
					self pushRepository: self repository andThen: [].
					self uiManager inform: ('Uploaded changes to {1}' format: {remote})
				]
			]
			ifFalse: [ 
				self basicCommitWithMessage: text.
			]
	]