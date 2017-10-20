patches
snapshot
	"I can happen that you are syncronizing packages present in two repositories (for example, 
	 metacello and pharo) and you want to see what changed anyway. What happens here is that 
	 commit from version is pointing to a commit in a different repository. In that case we 
	 take the snapshot from the last version present in the repository I want to compare."
	self flag: #todo. "Is kind of lame to ask for kind of version info, but so far is the 
	easiest way to fix a problem that emerges when moving from one not-iceberg repository to 
	one that it is."
	((self mcVersion info isKindOf: IceMCVersionInfo) 
		and: [ self repository =  self mcVersion info commit repository ])
		ifFalse: [ ^ self repository branch snapshotFor: self package ].
	^ super snapshot