accessing
messageText
	^ messageText ifNil: [self defaultMessageText format: { super messageText }]