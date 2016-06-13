building
statusFor: package
	package isLoaded 
		ifFalse: [ ^ 'Not loaded' ]
		ifTrue: [  ].
