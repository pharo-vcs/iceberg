private
patchVersionOf: packageName changes: changes message: message
	| mcWorkingCopy snapshot patcher |
	
	mcWorkingCopy := (RPackageOrganizer default packageNamed: packageName) mcWorkingCopy.
	snapshot := self workingCopy referenceCommit snapshotFor: (self packageNamed: packageName).
	patcher := MCPatcher snapshot: snapshot.
	changes 
		select: [ :each | each operation notNil ]
		thenDo: [ :each | each operation applyTo: patcher ].
	^ MCVersion new
		setPackage: mcWorkingCopy package
		info: (IceMCVersionInfo package: mcWorkingCopy package message: message)
		snapshot: patcher patchedSnapshot
		dependencies: #()