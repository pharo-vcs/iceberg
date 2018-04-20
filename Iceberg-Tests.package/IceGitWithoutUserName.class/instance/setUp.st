running
setUp

	| global |
	super setUp.
	global := self repository getConfigurationGlobal: true.
	username := global getString: 'user.name' ifAbsent: ''.
	email := global getString: 'user.mail' ifAbsent: ''.
	
	global unset: 'user.name'.
	global unset: 'user.mail'.
		
	(self repository getConfigurationGlobal: false)
		username: 'mock user';
		email: 'mock mail'.