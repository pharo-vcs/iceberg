instance-creation
from: source to: target
	
	^ self new
		sourceVersion: source;
		targetVersion: target;
		build;
		yourself