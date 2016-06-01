examples - commit
exampleGlamourCommitBrowser
	| repository changeSet |
	repository := IceRepository origin: 'git@github.com:npasserini/iceberg.git'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceGlamourCommitBrowser openOn: changeSet.