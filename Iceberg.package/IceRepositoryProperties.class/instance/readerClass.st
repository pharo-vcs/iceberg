accessing
readerClass
	^ properties 
		at: 'format' 
		ifPresent: [ :v | TIceRepositoryReader users detect: [ :each | each id = v  ] ]
		ifAbsent: [ TIceRepositoryReader users detect: #isDefault  ]
