instance-creation
readProjectFrom: anIceCommitish

	| readers |
	readers := (self allSubclasses
		collect: [ :each | each new ])
		sorted: [ :a :b | a priority < b priority ].
	
	^ (readers
		detect: [ :any | any canReadProjectFromCommitish: anIceCommitish ])
			readProjectFromCommitish: anIceCommitish