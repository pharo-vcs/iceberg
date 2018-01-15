patches
snapshot
	^ [ self lookupSnapshot ] 
		on: IceVersionDoesNotExist 
		do: [ MCSnapshot empty ]