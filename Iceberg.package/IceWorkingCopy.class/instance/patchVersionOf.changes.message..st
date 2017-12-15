private-monticello
patchVersionOf: packageName changes: changes message: message
	| workingCopy snapshot patcher |
	
	workingCopy := (RPackageOrganizer default packageNamed: packageName) mcWorkingCopy.
	
	self assert: self referenceCommit size = 1.
	snapshot := self referenceCommit first snapshotFor: (self packageNamed: packageName).
	
	patcher := MCPatcher snapshot: snapshot.
	changes 
		select: [ :each | each operation notNil ]
		thenDo: [ :each | each operation applyTo: patcher ].
	^ MCVersion new
		setPackage: workingCopy package
		info: (IceMCVersionInfo package: workingCopy package message: message)
		snapshot: patcher patchedSnapshot
		dependencies: #()