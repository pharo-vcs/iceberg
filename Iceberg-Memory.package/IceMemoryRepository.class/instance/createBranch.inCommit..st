branches
createBranch: branchName inCommit: aCommit

	| newBranchCommit iceCommit |

	(self head isUnbornBranch and: [ aCommit isNoCommit ])
		ifTrue: [ ^ head := IceMemoryUnbornBranch inRepository: self named: branchName ].

	(self hasBranchNamed: branchName)
		ifTrue: [ IceBranchAlreadyExists new
			branchName: branchName;
			signal ].
	
	newBranchCommit := self
		commitPackage: (MCPackage named: branchName)
		author: 'Branch created'
		message: branchName
		ancestors: #()
		dependencies: aCommit mcCommit dependencies
		inInternalRepository: branchRepository.
		
	"We create an ice commit. This is the commit that is visible in the model"
	iceCommit := IceMemoryCommit new.
	iceCommit repository: self.
	iceCommit mcCommit: newBranchCommit.
	
	^ (self newBranchNamed: branchName commit: iceCommit)
		switch;
		yourself