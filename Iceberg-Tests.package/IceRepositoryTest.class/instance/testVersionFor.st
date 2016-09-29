tests - versions
testVersionFor
	| version commitId|

	commitId := '503091320dcde204e3e5339742ca6ab18cde7c3f'.
	version := ((repository packageNamed: packageName) versionFor: commitId).
	
	self assert: (version isKindOf: IceSavedPackageVersion).
	self 
		assert: version commit parentIds first
		equals: '5f64053bb832c18c830be1e300ef4d0415c6dfe0'.

	self 
		assert: version commit datetime printString
		equals: '2016-08-01T12:41:28+02:00'