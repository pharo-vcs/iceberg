private
verifyDirectoryStructureIfMissing: aBlock
	self entity isMissing 
		ifTrue: [ ^ aBlock value: (self toErrorMessage: 'Local repository missing') ]