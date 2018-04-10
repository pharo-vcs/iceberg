testing
isDetached
	^ self entity workingCopy isDetached 
		or: [ self entity head isDetached ]