accessing
allTypes
	^ types ifNil: [ types := self createMergeBranchTypes ]