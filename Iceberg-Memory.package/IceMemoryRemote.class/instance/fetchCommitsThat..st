fetching
fetchCommitsThat: aBlock

	"Really low level.
	Copy all files from the remote branch reposiory to the local remote tracked branches repository"
	| remoteBranchRepository remoteCodeRepository |
	remoteBranchRepository := self remoteRepository branchRepository.
	remoteCodeRepository := self remoteRepository codeRepository.
	remoteBranchRepository allVersionInfos
		select: aBlock
		thenDo: [ :aVersionInfo | | remoteBranchVersion |
			remoteBranchVersion := remoteBranchRepository versionWithInfo: aVersionInfo.
			self assert: remoteBranchVersion notNil.
			branchRepository
				versionWithInfo: aVersionInfo
				ifAbsent: [ branchRepository storeVersion: remoteBranchVersion ].
			
			remoteBranchVersion dependencies do: [ :dependencyInfo |
				localRepository codeRepository
					versionWithInfo: dependencyInfo
					ifAbsent: [ localRepository codeRepository storeVersion: (remoteCodeRepository versionWithInfo: dependencyInfo) ] ] ]