Extension { #name : #Path }

{ #category : #'*Iceberg-Pharo6' }
Path >> pathString [
	"Return a string containing the path elements of the receiver, without the 'Path *' part"

	"((FileSystem workingDirectory / 'book-result' / 'W01-Welcome')
		relativeToReference: FileSystem workingDirectory) pathString
	>>> 'book-result/W01-Welcome'"

	^String streamContents: [ :stream | 
		self printPathOn: stream delimiter: self delimiter ]
]

{ #category : #'*Iceberg-Pharo6' }
Path >> printPathOn: aStream delimiter: aCharacter [
	"Print the receiver's path on aStream (without 'Path' prepended)"
	"String streamContents: [ :str| 
		((FileSystem workingDirectory / 'book-result' / 'W01-Welcome')
			relativeToReference: FileSystem workingDirectory) printPathOn: str delimiter: $|]
	>>> 'book-result|W01-Welcome'"

	(1 to: self size)
		do: [:index | aStream nextPutAll: (self at: index)]
		separatedBy: [aStream nextPut: aCharacter]
]
