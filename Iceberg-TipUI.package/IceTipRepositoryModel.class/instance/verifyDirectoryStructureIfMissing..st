private
verifyDirectoryStructureIfMissing: aBlock
	self entity isMissing 
		ifTrue: [ ^ aBlock value: (self toErrorMessage: 'Local repository missing') ].
	self entity isCodeMissing
		ifTrue: [ ^ aBlock value: (self toErrorMessage: 'Code directory missing') ].
