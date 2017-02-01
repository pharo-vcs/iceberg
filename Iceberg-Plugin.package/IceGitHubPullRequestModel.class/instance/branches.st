accessing
branches
	^ branches ifNil: [ branches := self repository allBranches select: #isRemote ]