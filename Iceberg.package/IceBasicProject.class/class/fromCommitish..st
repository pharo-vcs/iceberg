instance-creation
fromCommitish: anIceCommitish

	| readers |
	readers := (IceProjectReader allSubclasses
		collect: [ :each | each new ])
		sorted: [ :a :b | a priority < b priority ].
	
	^ readers
		detect: [ :any | any canReadProjectFromCommitish: anIceCommitish ]
		ifFound: [ :found | found readProjectFromCommitish: anIceCommitish ]
		ifNone: [ IceBasicProjectReader new readProjectFromCommitish: anIceCommitish ]