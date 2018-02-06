private
verifyDirectoryStructureIfMissing: aBlock
	self entity isMissing 
		ifTrue: [ ^ aBlock value: (self makeError: 'Local repository missing') ].
	self entity isCodeMissing
		ifTrue: [ ^ aBlock value: (self makeError: 'Code directory missing') ].
