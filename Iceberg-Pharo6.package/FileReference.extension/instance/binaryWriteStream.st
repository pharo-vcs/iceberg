*Iceberg-Pharo6
binaryWriteStream
	"Answer a binary write stream on the receiver"

	^ (filesystem writeStreamOn: self path) 
		binary;
		yourself