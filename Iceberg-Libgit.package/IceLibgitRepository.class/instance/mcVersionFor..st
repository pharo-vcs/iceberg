as yet unclassified
mcVersionFor: iceVersion
	[ | commit |
	commit := LGitCommit of: self repositoryHandle fromId: (LGitId fromHexString: iceVersion commit id).
	^ (self readerClass on: commit iceVersion: iceVersion) version ]
		on: IceMissingRepositoryEntry , LGit_GIT_ENOTFOUND
		do: [ IceVersionDoesNotExist new
				version: iceVersion;
				signal ]