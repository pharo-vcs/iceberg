actions
accept
	^ [ self doAccept. true ]
	on: AssertionFailure 
	do: [ :e | 
		UIManager default 
			alert: e messageText 
			title: ('{1}: Error' format: { self selectedType title }).
		false ]