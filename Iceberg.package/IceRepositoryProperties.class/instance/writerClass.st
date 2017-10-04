accessing
writerClass
	^ properties 
		at: 'format' 
		ifPresent: [ :v | TIceRepositoryWriter users detect: [ :each | each id = v  ] ]
		ifAbsent: [ TIceRepositoryWriter users detect: #isLegacyDefault  ]
