*Iceberg-Pharo6
binaryWriteStreamDo: aBlock
	"Pass a binary write stream on the receiver to the supplied block, and ensure that the stream is closed after evaluation."

	| stream |

	stream := self binaryWriteStream.
	^ [ aBlock value: stream ] 
		ensure: [ stream close ]