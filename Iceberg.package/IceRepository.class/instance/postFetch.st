private-remotes
postFetch
	
	"This method is called after every fetch.
	Fox possible broken references using unknown commits."
	
	self workingCopy referenceCommit isUnknownCommit
		ifTrue: [ (self lookupCommit: self workingCopy referenceCommit id) adopt ]