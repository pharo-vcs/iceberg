TOMOVE
snapshotFor: package 
	^ [ (self repository mcVersionFor: (self versionFor: package)) snapshot ]
		on: IceVersionDoesNotExist 
		do: [ :e | MCSnapshot empty ]