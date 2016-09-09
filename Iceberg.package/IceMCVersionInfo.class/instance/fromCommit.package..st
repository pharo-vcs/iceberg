initialization
fromCommit: commit package: package
	"This method can be used for first initializing a version info or to update a partially initialized version info."
	"See #fromPackage:message:"

	| datetime |
	datetime := commit time asDateAndTime. 
   	date := datetime asDate.
   	time := datetime asTime.
	
	name := ('{1}-{2}.{3}' format: {
		package name. 
		commit author name. 
		datetime asUnixTime 
	}).
	
	id := GitFileTreePackageEntry 
		uuidFromGitSHA: commit id asByteArray 
		package: package name.

   	message := commit comment.
   	author := commit username
