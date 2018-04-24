utilities
verifyBackendAvailabilityIfNot: aBlock
	| presentVersion requiredVersion |
	
	presentVersion := IceSemanticVersion fromArray: LGitLibrary uniqueInstance version.
	requiredVersion := self requiredLibGit2MinimumVersion.	
	requiredVersion <= presentVersion 
		ifFalse: [ ^ aBlock cull: requiredVersion cull: presentVersion ]