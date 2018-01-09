initialize-release
reset
	
	"Should initialize working copy state.
	 - If all packages in the image corresponding to repository packages are in the same commit and that commit is for this repository, set a single commit state.
	 - Otherwise set it in unknown commit state. The user may recover from this by doing an explicit merge."
	
	| loadedPackages commits |
	loadedPackages := self repository packages select: [ :each | each isLoaded ].
	loadedPackages do: [ :each | self addPackage: each ].
	
	commits := self packages collect: #currentCommit as: Set.
	
	commits size = 1
		ifTrue: [ 
			state := commits anyOne asWorkingCopyState.
			^ self ].
		
	state := IceUnknownCommitWorkingCopyState for: commits.