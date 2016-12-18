actions
switchBranch
	| branch |
	branch := self pickBranch.
	branch ifNil: [ ^ self ].	
	self repository checkoutBranch: branch name