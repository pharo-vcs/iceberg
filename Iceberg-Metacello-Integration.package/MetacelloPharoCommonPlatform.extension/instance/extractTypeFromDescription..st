*Iceberg-Metacello-Integration
extractTypeFromDescription: description
	(description beginsWith: 'ftp://') ifTrue: [ ^'ftp' ].
	IceMetacelloRepositoryType allTypes 
		detect:  [ :each | each isSuitableForLocation: description  ] 
		ifFound: [ :class | ^ class type ].
	^super extractTypeFromDescription: description