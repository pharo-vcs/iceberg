private
lookupVersionFor: anIceSavedPackage
	"I do not have my self a version for that package, so look for a version in a parent commit."
	self parents size = 0 ifTrue: [ ^ nil ].
	self parents size = 1 ifTrue: [ ^ self parents first properVersionFor: anIceSavedPackage ].
	
	"Multiple parents"
	((self parents collect: [ :parent | parent properVersionFor: anIceSavedPackage ] as: Set) select: #notNil) in: [ :possibleVersions |
		^ possibleVersions isEmpty 
			ifTrue: [ nil ]
			ifFalse: [ 
				possibleVersions 
					detect: [ :selectedVersion | 
						possibleVersions allSatisfy: [:anotherVersion | 
							anotherVersion isAncestorOf: selectedVersion ]]
					ifNone: [ CannotIdentifyVersionForCommit signal ]				
			]
	]
