private-monticello
mcVersionFor: iceVersion
	[ | commit |
	commit := iceVersion commit libgitCommit.
	^ (iceVersion commit readerClass on: commit iceVersion: iceVersion) version ]
		on: IceMissingRepositoryEntry , LGit_GIT_ENOTFOUND
		do: [ IceVersionDoesNotExist new
				version: iceVersion;
				signal ]