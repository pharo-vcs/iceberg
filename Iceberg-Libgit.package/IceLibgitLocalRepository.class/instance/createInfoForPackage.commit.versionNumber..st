private
createInfoForPackage: package commit: commit versionNumber: versionNumber
	| versionName datetime uuid |
	versionName := ('{1}-{2}.{3}' format: {
		package packageName. 
		commit author name. 
		versionNumber
	}).
	
	datetime := commit time asDateAndTime. 
	uuid := GitFileTreePackageEntry 
		uuidFromGitSHA: commit id asByteArray 
		package: package packageName.

   ^ MCVersionInfo
    	name: versionName
    	id: uuid 
    	message: commit message trim
    	date: datetime asDate
    	time: datetime asTime
    	author: commit author name
    	ancestors: #() "TODO"
    	stepChildren: #(). "TODO"