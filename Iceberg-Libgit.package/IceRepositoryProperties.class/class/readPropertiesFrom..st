instance creation
readPropertiesFrom: aFileReference
	self flag: #clean.	"When Pharo 6.1 will not be supported anymore we can directly use: `ref readStreamDo: [ :stream | STON fromStream: stream ]` but currently FileReference>>readStream return a ZnBufferedStream in Pharo 61 and a ZnCharacterReadStream decoding utf8 in Pharo 7."
	^ aFileReference
		binaryReadStreamDo: [ :stream | STON fromStream: (ZnCharacterReadStream on: stream encoding: 'utf8') ]