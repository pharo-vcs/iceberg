instance-creation
from: sourceCommitish to: targetCommitish
	
	^ self new
		source: sourceCommitish;
		target: targetCommitish;
		build;
		yourself