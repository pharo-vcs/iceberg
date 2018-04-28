actions
accept
	^ [[ self doAccept.
	true ]	on: IceError , IceWarning
		do: [ :e | e acceptError: (IceTipInteractiveErrorVisitor new). false ] ]
		on: AssertionFailure
		do: [ :e | 
			UIManager default
				alert: e messageText
				title: ('{1}: Error' format: {self selectedType title}).
			false ] 
	