actions
accept
	self username isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.name is required.' ].
	self email isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.email is required.' ].	
	
	(model getConfigurationGlobal: self isGlobal)
		username: self username;
		email: self email.
	
	self window delete.
	
	acceptCallback ifNotNil: [ 
		acceptCallback value ].