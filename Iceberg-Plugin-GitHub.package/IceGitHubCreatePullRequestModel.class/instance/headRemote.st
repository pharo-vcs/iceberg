accessing
headRemote 
	^ headRemote ifNil: [ self repository head upstream remote ]