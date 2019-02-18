*Iceberg-Pharo6
platformSizeTAt: byteOffset
	^ self 
		integerAt: byteOffset 
		size: FFIArchitecture forCurrentArchitecture sizeTTypeSize
		signed: false