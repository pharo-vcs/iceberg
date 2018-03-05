exceptionDescription
messageText
	^ messageText ifNil: [ self class defaultMessageText ]