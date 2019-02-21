Extension { #name : #FFIArchitecture }

{ #category : #'*Iceberg-Pharo6' }
FFIArchitecture >> externalSizeTType [
	^ ExternalType ulong
]

{ #category : #'*Iceberg-Pharo6' }
FFIArchitecture >> sizeTTypeSize [
	^ self externalSizeTType byteSize
]
