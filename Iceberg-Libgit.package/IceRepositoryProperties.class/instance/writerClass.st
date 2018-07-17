accessing
writerClass
	^ self properties
		at: 'format' 
		ifPresent: [ :v | TIceRepositoryWriter users detect: [ :each | each id = v  ] ]
		ifAbsent: [ 
			repository project isUnborn
				ifFalse: [ IceLibgitRepository defaultFileFormat ]
				ifTrue: [ TIceRepositoryWriter users
					detect: #isLegacyDefault
					ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ] ]  ]
