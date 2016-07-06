private
lookupVersionsOfPackage: anIceSavedPackage 
	"Load versions from the real repository, latest first"
	| versions | 
	versions := OrderedCollection new.
	
	self commitsInCurrentBranchDo: [ :commit |
		(commit changesFileNamed: anIceSavedPackage packageName, '.package')
			ifTrue: [ versions add: (IceSavedPackageVersion savedPackage: anIceSavedPackage commit: commit) ]
	].

	^ versions
