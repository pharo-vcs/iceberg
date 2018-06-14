accessing
writerClass
	"We return a default legacy writer just for metacello backwards compatibility"
	^ repository properties properties 
		at: 'format' 
		ifPresent: [ :v | TIceRepositoryWriter users detect: [ :each | each id = v  ] ]
		ifAbsent: [ 
			TIceRepositoryWriter users
				detect: #isLegacyDefault
				ifNone: [ Smalltalk at: #IceLibgitFiletreeWriter ]  ]