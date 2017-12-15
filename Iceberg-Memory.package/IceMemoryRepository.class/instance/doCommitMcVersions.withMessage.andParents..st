private-commits
doCommitMcVersions: modifiedVersions withMessage: message andParents: parentCommitishList
	
	| newCommit versionInfos packageNames iceCommit |

	packageNames := head commit packageNames asSet union: (modifiedVersions collect: [ :version | version package name ]).
	versionInfos := packageNames collect: [ :packageName |
		(modifiedVersions collect: #info)
			detect: [ :version | version name = packageName ]
			ifNone: [ head commit mcCommit dependencies detect: [ :mcVersionInfo | mcVersionInfo name = packageName ] ] ].

	newCommit := self
		commitPackage: (MCPackage named: (head isUnbornBranch ifFalse: [ head name ] ifTrue: [ head nameForFirstCommit ]))
		author: 'Lala?'
		message: message
		ancestors: (parentCommitishList collect: [:each | each mcCommit info ])
		dependencies: versionInfos
		inInternalRepository: branchRepository.
		
	"We create an ice commit. This is the commit that is visible in the model"
	iceCommit := IceMemoryCommit new.
	iceCommit repository: self.
	iceCommit mcCommit: newCommit.
	
	head isUnbornBranch ifTrue: [
		self switchToBranchNamed: head nameForFirstCommit onCommit: iceCommit.
	] ifFalse: [
		head commit: iceCommit.
	].
	
	^ iceCommit