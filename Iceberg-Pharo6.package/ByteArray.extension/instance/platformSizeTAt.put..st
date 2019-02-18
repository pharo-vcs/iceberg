*Iceberg-Pharo6
platformSizeTAt: byteOffset put: value
	self 
		integerAt: byteOffset
		put: value
		size: FFIArchitecture forCurrentArchitecture sizeTTypeSize
		signed: false