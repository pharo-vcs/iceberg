API-branches
createBranch: branchName
	| newBranch |
	"This is really low level and may provoke problems.
	Libgit does not provide an API to change branch when the repository is unborn.
	Instead, we replace the HEAD file adding a reference with the new branch.
			
	This may break other existing refs in the repository."
	self handleLibgitError: [ [ self repositoryHandle isUnborn
				ifTrue: [ (self location / '.git' / 'HEAD')
						ensureDelete;
						writeStreamDo: [ :stream | 
							stream
								nextPutAll: 'ref: refs/heads/';
								nextPutAll: branchName ] ]
				ifFalse: [ newBranch := self repositoryHandle createBranch: branchName target: self repositoryHandle head.
					self repositoryHandle setHead: newBranch ] ]
				on: LGit_GIT_EEXISTS
				do: [ :error | 
					IceBranchAlreadyExists new
						branchName: branchName;
						signal ].
			^ self head ]