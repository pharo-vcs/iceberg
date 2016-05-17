accessing
workingCopiesForRepository: repository
	"Retrieve the working copies of all packages in a repository."
	^ repository allPackages collect: [ :package | self workingCopyForPackage: package ]