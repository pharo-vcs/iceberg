instance-creation
from: sourceCommitish to: targetCommitish
	
	^ self new
		sourceVersion: sourceCommitish;
		targetVersion: targetCommitish;
		build;
		yourself