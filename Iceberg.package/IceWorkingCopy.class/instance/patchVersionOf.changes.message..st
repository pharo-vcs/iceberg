private-monticello
patchVersionOf: packageName changes: changes message: message
	| mcPackage snapshot patcher |
	
	mcPackage := (self packageNamed: packageName) mcPackage.
	snapshot := self snapshotFor: (self packageNamed: packageName).
	
	patcher := MCPatcher snapshot: snapshot.
	changes 
		select: [ :each | each operation notNil ]
		thenDo: [ :each | each operation applyTo: patcher ].
	^ MCVersion new
		setPackage: mcPackage
		info: (IceMCVersionInfo package: mcPackage message: message)
		snapshot: patcher patchedSnapshot
		dependencies: #()