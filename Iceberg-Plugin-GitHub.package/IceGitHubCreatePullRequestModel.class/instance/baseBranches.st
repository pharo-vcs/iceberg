private
baseBranches
	^ baseBranches ifNil: [ 
		baseBranches := self requestBaseBranches ]