instance-creation
newPatchMorph
	"Answer a new patch morph."

	^IceMergePatchMorph new
		borderWidth: 0;
		addDependent: self;
		yourself