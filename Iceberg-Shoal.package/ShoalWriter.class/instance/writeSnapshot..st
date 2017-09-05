writing
writeSnapshot: aSnapshot
	snapshot := aSnapshot.
	
	"ensure package dirs exists. 
	 It has to be just one but well..."
	snapshot definitions 
		select: #isOrganizationDefinition
		thenDo: [ :each | self writePackage: each ].
	"now export classes"
	snapshot definitions 
		select: #isClassDefinition
		thenDo: [ :each | self writeClass: each ].
	"... and method extensions"
	self writeMethodExtensions.