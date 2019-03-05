Extension { #name : #IceRepository }

{ #category : #'*Iceberg-Changes' }
IceRepository >> fullWorkingCopyDiff [
	^ IceDiff new
		source: self workingCopy;
		target: self head;
		buildFull;
		yourself
]

{ #category : #'*Iceberg-Adapters' }
IceRepository >> metacelloAdapter: version [
	^ IceMetacelloRepositoryAdapter for: self withVersion: version
]
