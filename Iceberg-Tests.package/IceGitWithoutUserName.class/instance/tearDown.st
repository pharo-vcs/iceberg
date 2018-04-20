running
tearDown

	| global |
	global := self repository getConfigurationGlobal: true.
	global username: username.
	global email: email.
		
	super tearDown.
