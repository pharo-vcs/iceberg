private
reportError: error
	
	| message |
	message := error messageBody.
	message = 'Invalid field: head'
		ifTrue: [ message := 'Branch does not exist on github. Please commit and push your changes.' ].
	UIManager default 
		alert: message
		title: 'Error creating pull request: ', error messageText