repository handling
createRepository
	^ IceMCGitRepository new
		remoteUrl: self origin url;
		branch: (self branch ifNil: 'master');
		subdirectory: '';
		readonly: false;
		gitCloneRepositoryAndCheckoutIn: ('iceberg-cache/{1}/{2}' format: { self origin owner. self origin projectName });
		yourself

"gitCloneRepositoryAndCheckoutIn: aDirectoryName
	| targetDir targetDirName |
	targetDirName := readonly
		ifTrue: [ aDirectoryName , '-readonly' ]
		ifFalse: [ aDirectoryName ].
	targetDir := targetDirName asFileReference.
	targetDir exists
		ifTrue: [ 
			| targetDirBranch |
			self
				directory:
					(subdirectory isEmpty
						ifTrue: [ targetDir ]
						ifFalse: [ targetDir / subdirectory ]).
			targetDirBranch := self currentBranch.
			((branch isNil and: [ targetDirBranch = 'master' ]) or: [ targetDirBranch = branch ])
				ifFalse: [ 
					self
						error:
							'GitFileTree target directory already exists and is on another branch, cancelling clone and repository instanciation : '
								, (self fileUtils directoryPathString: targetDir) ] ]
		ifFalse: [ 
			self
				gitCommand:
					#('clone')
						,
							(branch
								ifNil: [ #() ]
								ifNotNil: [ 
									{'-b'.
									branch} ])
						,
							(readonly
								ifTrue: [ #('--depth' '1') ]
								ifFalse: [ #() ])
						,
							{remoteUrl.
							targetDirName}
				in: FileSystem workingDirectory.
			GrowlMorph openWithLabel: 'gitfiletree://' contents: 'Cloning remote repository: done!'.
			self
				directory:
					(subdirectory isEmpty
						ifTrue: [ targetDir ]
						ifFalse: [ targetDir / subdirectory ]) ]"