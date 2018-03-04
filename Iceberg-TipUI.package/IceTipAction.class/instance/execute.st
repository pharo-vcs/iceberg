executing
execute
	self withErrorHandlingDo: [ 
		self basicExecute.
		finishBlock ifNotNil: [ finishBlock value ] ]