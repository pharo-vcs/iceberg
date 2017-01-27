tests
testWritePackage
	| package wc mcVersion |
	package := repository packageNamed: packageName.
	package loadLatest.
	wc := package workingCopy.

	mcVersion := MCVersion
		package: wc package
		info: wc ancestors first
		snapshot: wc snapshot
		dependencies: #().
		
	IceMetadatalessFileTreeWriter 
		fileOut: mcVersion 
		on: (IceBackendWriterAdapter for: repository backend).

	self assert: (repository location allChildrenMatching: 'methodProperties.json') isEmpty