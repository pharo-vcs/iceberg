tests
hexDumped: bytesWithIlegalLeadingBytes
	
	^ String streamContents: [ :str |
		bytesWithIlegalLeadingBytes hexDumpOn: str max: Float infinity ].