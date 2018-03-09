testing
isDetached
	^ entity workingCopy isDetached 
		or: [ entity head isDetached ]