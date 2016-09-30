initialization
fromCommit: aCommit package: aPackage
	"This method can be used for first initializing a version info or to update a partially initialized version info."
	"See #fromPackage:message:"
	commit := aCommit.
	package := aPackage.
	
   	date := commit datetime asDate.
   	time := commit datetime asTime.
	
	name := ('{1}-{2}.{3}' format: {
		package name. 
		commit username. 
		commit datetime asUnixTime 
	}).
	
	id := GitFileTreePackageEntry 
		uuidFromGitSHA: commit id asByteArray 
		package: package name.

   	message := commit comment.
   	author := commit username
