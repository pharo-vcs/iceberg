actions
accept
	^ [ self doAccept.
	true ]
		on: IceError , IceWarning
		do: [ :e | 
			e acceptError: IceTipInteractiveErrorVisitor new.
			false ]