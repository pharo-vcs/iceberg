private
allBaselines
	^ ((self workingCopy packages
		select: [ :each | each name beginsWith: 'BaselineOf' ])
		sorted: [ :a :b | a name < b name ])