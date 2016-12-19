accessing
pullingRemote
	^ pullingRemote ifNil: [ self pushingRemote ]