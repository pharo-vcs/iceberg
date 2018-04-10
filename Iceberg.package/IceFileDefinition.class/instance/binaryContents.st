accessing
binaryContents

	^ fileReference binaryReadStreamDo: [ :str | str upToEnd ]