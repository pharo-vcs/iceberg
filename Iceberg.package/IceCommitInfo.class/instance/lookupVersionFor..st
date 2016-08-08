private
lookupVersionFor: anIceSavedPackage
	"I do not have my self a version for that package, so look for a v Unknown input at end ->ersion in a parent commit."
	self parents size = 0 ifTrue: [ ^ nil ].
	self parents size = 1 ifTrue: [ ^ self parents first versionFor: anIceSavedPackage ].
	
	"Multiple parents"
	(self parents collect: [ :parent | parent versionFor: anIceSavedPackage ] as: Set) in: [ :possibleVersions |
			^ possibleVersions 
				detect: [ :selectedVersion | 
					possibleVersions allSatisfy: [:anotherVersion | 
						anotherVersion isAncestorOf: selectedVersion ]]
				ifNone: [ CannotIdentifyVersionForCommit signal ]
				
	]
