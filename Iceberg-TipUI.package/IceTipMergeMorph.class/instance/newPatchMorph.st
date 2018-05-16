instance-creation
newPatchMorph
	"Answer a new patch morph."

	^IceTipMergePatchMorph new
		borderWidth: 0;
		addDependent: self;
		yourself