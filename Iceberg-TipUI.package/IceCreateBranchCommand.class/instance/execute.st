execute
execute
	| selection |
	selection := UIManager default
		request: 'Please provide the name of the new branch to be created'
		initialAnswer: ''
		title: 'Create new branch'.
	selection isEmptyOrNil ifTrue: [ ^ self ].
	self repository createBranch: selection.
	self beSuccess