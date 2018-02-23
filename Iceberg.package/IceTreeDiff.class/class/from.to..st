instance-creation
from: source to: target 
	
	^ self new
		source: source;
		target: target;
		build;
		yourself