patching
addModification: anIceModification toPatcher: aMCPatcher 

	"In MC there is no such thing as a MCPackage definition.
	Instead, we should manage organization definitions.
	The problem is that they have no identity: they do not know the package they belong to.
	Then, if we just apply this modification, we end up just adding a new definition (and having both).
	To solve this, we remove the old organization and add the new one explicitly."

	aMCPatcher removeDefinition: anIceModification rightDefinition asMCDefinition.
	^ aMCPatcher addDefinition: anIceModification leftDefinition asMCDefinition