Extension { #name : 'IceRepository' }

{ #category : '*Iceberg-Tests' }
IceRepository >> latestVersion: packageName [
	^ (self packageNamed: packageName) latestVersion

]

{ #category : '*Iceberg-Tests' }
IceRepository >> loadPackageNamed: packageName [

	self workingCopy
		loadPackageNamed: packageName
		fromCommit: self head commit
]
