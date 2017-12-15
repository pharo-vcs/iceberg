actions
computeLoadedVersionOf: anIceSavedPackage
	| workingCopyAncestors |
	workingCopyAncestors := anIceSavedPackage package workingCopy ancestors.
	workingCopyAncestors ifEmpty: [ ^ IceTemporaryVersion forPackage: anIceSavedPackage ].

	anIceSavedPackage workingCopy ancestors
		detect: [ :ancestor | 
			(ancestor respondsTo: #iceVersion) and: [ 
			(ancestor commit notNil) and: [
			self frontend includesCommit: ancestor commit ]]]
		ifFound: [ :ancestor | ^ ancestor iceVersion ].

	anIceSavedPackage workingCopy repositoryGroup repositories do: [ :mcRepo |
		mcRepo 
			commitIdFor: anIceSavedPackage workingCopy 
			ifFound: [ :commitish | 
				[ 
					| commit |
					commit := (self frontend revparse: commitish).
					^ commit versionFor: anIceSavedPackage 
				] 
				on: LGit_GIT_ENOTFOUND 
				do: [
					"If we cannot parse commitish, we asume that it is a commit ID which is unknown for this repo, 
					so we just ignore it. Maybe we should consider other cases and handle them adecquately."
				]]
	].
		
	^ IceForeignVersion forPackage: anIceSavedPackage.
