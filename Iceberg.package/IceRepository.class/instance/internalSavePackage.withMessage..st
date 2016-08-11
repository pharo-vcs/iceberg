private
internalSavePackage: package withMessage: commitMessage
	"Save a package to the underlying store but do not commit"
	| workingCopy newVersion |
	workingCopy := 	package workingCopy.
	newVersion := workingCopy 
		newVersionWithName: package nextVersionName
		message: commitMessage "I am not sure that this message will be saved."
		in: self backend. 

	self backend internalStoreVersion: newVersion.
	SystemAnnouncer uniqueInstance
		announce: (MCVersionSaved version: newVersion repository: self backend).
	
	self halt.
	^ newVersion 
	
	