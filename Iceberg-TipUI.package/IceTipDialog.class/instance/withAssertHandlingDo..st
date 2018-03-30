private
withAssertHandlingDo: aBlock
	^ aBlock 
		on: AssertionFailure 
		do: [ :e | 
			UIManager default 
				alert: e messageText
				title: 'Error: ', self title .
			^ false ]