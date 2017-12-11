accessing
messageText
	^ super messageText ifEmpty: [ self defaultMessageText ]