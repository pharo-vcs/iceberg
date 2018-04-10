private
allBaselines
	^ ((self workingCopy packages
		select: [ :each | each name beginsWith: self class baselinePrefix ])
		sorted: [ :a :b | a name < b name ])