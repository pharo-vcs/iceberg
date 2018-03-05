accessing
messageText
	^ messageText ifNil: [ self class defaultMessageText ]