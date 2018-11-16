accessing
allTypes
	^ types ifNil: [ types := self createCheckoutBranchTypes ]