initialization
initializeRepository: aRepository
	| ref |
	self initialize.
	ref := self fileFor: aRepository.
	properties := ref exists 
		ifTrue: [ ref readStreamDo: [ :stream | STON fromStream: stream ] ]
		ifFalse: [ Dictionary new ]