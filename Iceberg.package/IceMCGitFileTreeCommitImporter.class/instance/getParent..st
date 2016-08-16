private
getParent: parent
	^ entryVersionIndex at: (ByteArray readHexFrom: (parent copyFrom: 1 to: 7)) asInteger