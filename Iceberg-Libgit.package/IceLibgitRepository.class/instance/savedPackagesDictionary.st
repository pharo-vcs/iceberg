accessing
savedPackagesDictionary
	self halt.
	^ savedPackages ifNil: [ savedPackages := self lookupPackages ]