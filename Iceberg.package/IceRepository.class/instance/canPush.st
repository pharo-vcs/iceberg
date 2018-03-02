testing
canPush
	
	^ self head isDetached not and: [ 
		self branch tracksRemoteBranch ]