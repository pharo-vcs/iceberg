private
findVersionInfo 
	| repo remote commit |

	(self class lastCommitFound notNil 
		and: [ self class lastCommitFound id = commitId ])
		ifTrue: [ 
			commit := self class lastCommitFound.
			repo := commit repository ]
		ifFalse: [ 
			remote := IceGitRemote url: remoteUrl.
			repo := IceRepository registry 
				detect: [ :eachRepo | 
					eachRepo remotes 
						anySatisfy: [ :each | each referencesSameRemoteLocationAs: remote ] ]
				ifNone: [ ^ nil ].
			commit := repo lookupCommit: commitId.
			commit ifNil: [ 
				IceError signal: ('Your repository seems to be out of sync.!
Please fetch from "{1}" and try again.' 
					format: { remote }) ].
			self class lastCommitFound: commit ].
	
	^ IceMCVersionInfo new 
		fromCommit: commit 
		package: (IcePackage named: packageName repository: repo)