storing
storeInRepository: anIceRepository

	"I am a package, I have to export my changes using the repository format.
	Thus, I cut here the recursion on my children, I have to do the recursion myself"
	
	| mcPackage snapshot patcher version |
	mcPackage := self package mcPackage.
	
	"Take a snapshot of the package from the version we want to apply our changes on (usually the commit in disk) and apply them to it.
	This will create a snapshot with only the selected changes"
	snapshot := self rightVersion snapshotFor: self package.
	patcher := MCPatcher snapshot: snapshot.
	self changes do: [ :e | e applyOperationOn: patcher ].		
	version := MCVersion new
		setPackage: mcPackage
		info: (IceMCVersionInfo package: mcPackage message: 'Internal...')
		snapshot: patcher patchedSnapshot
		dependencies: #().

	"Save version to disk.
	The repository will take care of the correct output format.
	Note: this step does not perform a commit, it just exports changes so the repository can then perform a commit"
	anIceRepository internalStoreVersion: version.