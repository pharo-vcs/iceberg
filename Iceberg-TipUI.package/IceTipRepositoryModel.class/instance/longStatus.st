accessing
longStatus

	(entity isMissing and: [ entity location isNil ])
		ifTrue: [ ^ 'Not configured git repository. Please clone the repository or change the repository location to an existing location' ].
	entity isMissing 
		ifTrue: [ ^ 'Cannot find a git repository at {1}. Please clone the repository again or change the repository location to an existing location' format: { entity location } ].
				
	entity workingCopy workingCopyState isUnknownCommitState 
		ifTrue: [ ^ 'This repository was created from commit {1} but the commit is not in your disk repository. You may fetch the correct commit from a remote repository or discard the code in your image and load what is in the repository.' format: { entity workingCopy referenceCommit shortId } ].	
	entity workingCopy isDetached 
		ifTrue: [ ^ 'The working copy commit {1} does not correspond with the repository commit {2}. You may synchronize them to continue: discard your image changes or change the repository to point to your commit.' format: { entity workingCopy referenceCommit shortId. entity headCommit shortId } ].
	entity head isDetached 
		ifTrue: [ ^ 'The repository is in detached head state in commit {1}. You may checkout a branch to continue.' format: { entity headCommit shortId } ].

	entity workingCopy project isUnborn
		ifTrue: [ ^ 'Cannot find a project in your repository. Please edit your repository meta-data to indicate the source code directory or change a location to a valid iceberg repository' ].


	^ 'Your repository seems ok. Please report a ticket in Iceberg''s issue tracker. If you can, please send us a backup of your image in this state for debugging.'