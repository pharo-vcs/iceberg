instance-creation
fromFileReference: aFileReference commitish: aCommitish inRepository: anIceLibgitRepository 
	
	| properties |
	properties := aFileReference binaryReadStreamDo: [ :stream | STON fromStream: (ZnCharacterReadStream on: stream encoding: 'utf8') ].
	^ self onProperties: properties commitish: aCommitish inRepository: anIceLibgitRepository