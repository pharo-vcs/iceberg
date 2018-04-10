operations
fetchFrom: aRemote
	
	"Really low level.
	Copy all files from the remote branch reposiory to the local remote tracked branches repository"
	| remoteMCRepository |
	remoteMCRepository := aRemote remoteRepository branchRepository.
	remoteMCRepository allVersionInfos do: [ :aVersionInfo |
		(aVersionInfo name = name)
			ifTrue: [
				repository remoteBranchRepository
					versionWithInfo: aVersionInfo
					ifAbsent: [ repository remoteBranchRepository storeVersion: (remoteMCRepository versionWithInfo: aVersionInfo) ] 
			]]