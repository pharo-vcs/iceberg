initialization
initialize

	model ifNil: [ model := IceCredentialStore current ].	
	super initialize.
