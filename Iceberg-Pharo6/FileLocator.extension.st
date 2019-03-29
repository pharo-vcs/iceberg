Extension { #name : #FileLocator }

{ #category : #'*Iceberg-Pharo6' }
FileLocator >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStream
]
