accessing
messageText
	^ super messageText ifEmpty: [ 
		self signaler ifNotNil: [ :s | s messageText ] ]