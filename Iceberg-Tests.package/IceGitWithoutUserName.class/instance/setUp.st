running
setUp

	| global |
	super setUp.
	global := self repository getConfigurationGlobal: true.
	username := global username.
	email := global email.
	
	global unset: 'user.name'.
	global unset: 'user.mail'.
		
	(self repository getConfigurationGlobal: false)
		username: 'mock user';
		email: 'mock mail'.