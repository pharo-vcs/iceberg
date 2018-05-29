accessing
writerClass
	^ self properties 
		at: 'format' 
		ifPresent: [ :v | TIceRepositoryWriter users detect: [ :each | each id = v  ] ]
		ifAbsent: [ 
			TIceRepositoryWriter users
				detect: #isLegacyDefault
				ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ]  ]
