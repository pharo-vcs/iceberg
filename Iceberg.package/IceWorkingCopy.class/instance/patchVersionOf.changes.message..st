private-monticello
patchVersionOf: packageName changes: changes message: message
	| workingCopy snapshot patcher |
	
	workingCopy := (RPackageOrganizer default packageNamed: packageName) mcWorkingCopy.
	
	snapshot := self referenceCommit snapshotFor: (self packageNamed: packageName).
	
	patcher := MCPatcher snapshot: snapshot.
	changes 
		select: [ :each | each operation notNil ]
		thenDo: [ :each | each operation applyTo: patcher ].
	^ MCVersion new
		setPackage: workingCopy package
		info: (IceMCVersionInfo package: workingCopy package message: message)
		snapshot: patcher patchedSnapshot
		dependencies: #()