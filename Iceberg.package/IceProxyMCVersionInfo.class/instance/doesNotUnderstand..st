reflective operations
doesNotUnderstand: aMessage
	^ aMessage sendTo: (self findVersionInfo 
		ifNotNil: [ :versionInfo | self becomeForward: versionInfo copyHash: false ]
		ifNil: [ self stubVersionInfo ])