Extension { #name : #FileReference }

{ #category : #'*Iceberg-Pharo6' }
FileReference >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ (filesystem writeStreamOn: self path) 
		binary;
		yourself
]
