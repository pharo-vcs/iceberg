querying
versionsChangedSince: anotherCommit
	| changes | 	
	changes := OrderedCollection new.
	self repository loadedPackages do: [ :package | 
		| myVersion theirVersion |
		myVersion := self properVersionFor: package.
		theirVersion := anotherCommit properVersionFor: package.
		(myVersion = theirVersion)
			ifFalse: (changes add: myVersion)
	].
	
	^ changes
