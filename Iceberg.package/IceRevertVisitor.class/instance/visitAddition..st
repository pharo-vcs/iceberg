visiting
visitAddition: anIceAddition 

	"We are undoing an addition: this requires removing the parent and let the system manage the removal of children"
	anIceAddition definition asMCDefinition ifNotNil: #unload.