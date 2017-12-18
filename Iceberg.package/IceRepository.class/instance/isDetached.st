testing
isDetached
	
	^ self workingCopy isDetached
		or: [ self head isDetached ]