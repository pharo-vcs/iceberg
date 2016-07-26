private
lookupVersionFor: anIceSavedPackage
	"I do not have my self a version for that package, so look for a version in a parent commit."
		| parentVersions |
	self parents size = 0 ifTrue: [ ^ nil ].
	self parents size = 1 ifTrue: [ ^ self parents first versionFor: anIceSavedPackage ].
	
	"Multiple parents"
	(self parents collect: [ :parent | parent versionFor: anIceSavedPackage ] as: Set) in: [ :possibleVersions |
		possibleVersions size = 1
			ifTrue: [ ^ possibleVersions anyOne ]
			ifFalse: [ CannotIdentifyVersionForCommit signal ]
	]
