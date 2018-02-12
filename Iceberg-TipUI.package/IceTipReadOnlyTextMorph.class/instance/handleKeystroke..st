event handling
handleKeystroke: anEvent
	anEvent wasHandled
		ifTrue: [^ self].
	self allowsKeymapping
		ifTrue: [ self dispatchKeystrokeForEvent: anEvent ]