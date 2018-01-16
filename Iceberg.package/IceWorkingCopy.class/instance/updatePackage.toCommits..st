private-commits
updatePackage: anIceSavedPackage toCommits: aCollection
	
	| ancestry |
	anIceSavedPackage isLoaded 
		ifFalse: [ ^ self ].
	
	ancestry := MCWorkingAncestry new.
	aCollection do: [ :commit |
		ancestry addAncestor: (IceMCVersionInfo new
				fromCommit: commit
				package: anIceSavedPackage) ].
	anIceSavedPackage mcWorkingCopy ancestry: ancestry.