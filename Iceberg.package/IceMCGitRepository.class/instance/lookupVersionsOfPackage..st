private
lookupVersionsOfPackage: anIceSavedPackage 
	"Load versions from the real repository, latest first"
	^ (self getVersionsForPackageDirectoryName: anIceSavedPackage packageName, '.package')
		reverse collect: [ :entry | IceSavedPackageVersion savedPackage: anIceSavedPackage entry: entry ]
