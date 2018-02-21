importing
importOn: aNode
	
	| packageNode snapshot |
	
	"If the version does not include the package, we do not calculate a snapshot nor import it"
	(version includesPackageNamed: self packageName)
		ifFalse: [ ^ self ].
	
	packageNode := aNode addChild: (IcePackageDefinition named: self packageName).
	snapshot := self snapshot.
	snapshot definitions do: [ :e | 
		e accept: (IceMCDefinitionImporter new
			packageNode: packageNode;
			snapshot: snapshot;
			yourself) ].
	^ packageNode