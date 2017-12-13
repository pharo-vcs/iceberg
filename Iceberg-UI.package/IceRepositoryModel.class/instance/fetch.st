actions
fetch
	[ ^ self repository fetch ]
	on: IceAuthenticationError do: [ :e | e acceptError: IceInteractiveErrorVisitor new ]