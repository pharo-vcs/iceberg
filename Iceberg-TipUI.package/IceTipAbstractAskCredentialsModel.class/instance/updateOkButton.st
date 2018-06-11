updating
updateOkButton
	
	self window ifNil: [ ^ self ].
	self window toolbar ifNil: [ ^ self ].
	
	self window toolbar okButton enabled: (self isOkEnabled)