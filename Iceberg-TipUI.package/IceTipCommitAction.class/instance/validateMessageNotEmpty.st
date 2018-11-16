validating
validateMessageNotEmpty
	self message ifEmpty: [ IceNoCommitMessage signal ]