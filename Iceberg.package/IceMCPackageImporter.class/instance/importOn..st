importing
importOn: aNode
	
	| packageNode snapshot definition |
	
	"If the version does not include the package, we do not calculate a snapshot nor import it"
	(version includesPackageNamed: self packageName)
		ifFalse: [ ^ self ].
	
	definition := IcePackageDefinition named: self packageName.
	packageNode := aNode addChild: definition.
	definition path: packageNode path.
	
	snapshot := self snapshot.
	snapshot definitions do: [ :e | 
		e accept: (IceMCDefinitionImporter new
			packageNode: packageNode;
			snapshot: snapshot;
			yourself) ].
	^ packageNode