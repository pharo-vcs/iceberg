private-monticello
patchVersionOf: packageName changes: changes message: message
	| mcPackage snapshot patcher |
	
	"Prepare a patched version containing only the selected changes"
	mcPackage := (self packageNamed: packageName) mcPackage.
	
	"Take a snapshot of the package from the reference commit and apply changes to it.
	This will create a snapshot with only the selected changes"
	snapshot := self referenceCommit snapshotFor: (self packageNamed: packageName).
	patcher := MCPatcher snapshot: snapshot.
	changes 
		select: [ :each | each operation notNil ]
		thenDo: [ :each | each operation applyTo: patcher ].
		
	^ MCVersion new
		setPackage: mcPackage
		info: (IceMCVersionInfo package: mcPackage message: message)
		snapshot: patcher patchedSnapshot
		dependencies: #()