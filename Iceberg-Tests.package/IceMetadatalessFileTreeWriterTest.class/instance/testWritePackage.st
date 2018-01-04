tests
testWritePackage
	| wc mcVersion |
	repository checkout.
	wc := (MCPackage named: packageName) workingCopy.

	mcVersion := MCVersion new
		setPackage: wc package
		info: wc ancestors first
		snapshot: wc snapshot
		dependencies: #().
		
	IceMetadatalessFileTreeWriter 
		fileOut: mcVersion 
		on: (IceBackendWriterAdapter for: repository).

	self assert: (repository location allChildrenMatching: 'methodProperties.json') isEmpty