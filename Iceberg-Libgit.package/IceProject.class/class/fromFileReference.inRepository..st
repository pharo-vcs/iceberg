instance-creation
fromFileReference: aFileReference inRepository: anIceLibgitRepository 
	
	| properties |
	properties := aFileReference binaryReadStreamDo: [ :stream | STON fromStream: (ZnCharacterReadStream on: stream encoding: 'utf8') ].
	^ self new
		repository: anIceLibgitRepository;
		properties: properties;
		yourself