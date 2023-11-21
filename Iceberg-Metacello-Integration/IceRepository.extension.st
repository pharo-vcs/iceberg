Extension { #name : 'IceRepository' }

{ #category : '*Iceberg-Metacello-Integration' }
IceRepository >> metacelloAdapter: version [
	^ IceMetacelloRepositoryAdapter for: self withVersion: version
]
