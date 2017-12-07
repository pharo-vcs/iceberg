private
findVersionInfo 
	| repo remote commit |

	(self class lastCommitFound notNil 
		and: [ self class lastCommitFound id = commitId ])
		ifTrue: [ 
			commit := self class lastCommitFound.
			repo := commit repository ]
		ifFalse: [ 
			remote := IceRemote url: remoteUrl.
			repo := IceRepository registry 
				detect: [ :eachRepo | 
					eachRepo remotes 
						anySatisfy: [ :each | each referencesSameRemoteLocationAs: remote ] ]
				ifNone: [ ^ nil ].
			commit := repo commitAt: commitId.
			commit ifNil: [ 
				IceError signal: ('Your repository seems to be out of sync.!
Please fetch from "{1}" and try again.' 
					format: { remote }) ].
			self class lastCommitFound: commit.
			repo loadedCode refreshTo: commit ].
	
	^ IceMCVersionInfo new 
		fromCommit: commit 
		package: (IceSavedPackage named: packageName repository: repo)