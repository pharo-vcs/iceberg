reading
readProjectFromCommitish: anIceCommitish 

	| properties projectFileReference |
	projectFileReference := anIceCommitish fileSystem / '.project'.
	properties := projectFileReference binaryReadStreamDo: [ :stream | STON fromStream: (ZnCharacterReadStream on: stream encoding: 'utf8') ].
	^ IceBasicProject onProperties: properties commitish: anIceCommitish