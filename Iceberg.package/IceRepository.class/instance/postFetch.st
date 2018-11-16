private-remotes
postFetch
	"This method is called after every fetch.
	Fox possible broken references using unknown commits."
	| maybeGoodCommit |
	
	self workingCopy referenceCommit isUnknownCommit ifFalse: [ ^ self ].
	maybeGoodCommit := self lookupCommit: self workingCopy referenceCommit id.
	maybeGoodCommit isUnknownCommit ifFalse: [ 	maybeGoodCommit adopt ]