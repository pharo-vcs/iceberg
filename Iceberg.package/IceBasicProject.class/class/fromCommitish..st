instance-creation
fromCommitish: anIceCommitish

	| readers |
	readers := IceProjectReader allSubclasses
		collect: [ :each | each new ].
	
	^ readers
		detect: [ :any | any canReadProjectFromCommitish: anIceCommitish ]
		ifFound: [ :found | found readProjectFromCommitish: anIceCommitish ]
		ifNone: [ IceBasicProjectReader new readProjectFromCommitish: anIceCommitish ]