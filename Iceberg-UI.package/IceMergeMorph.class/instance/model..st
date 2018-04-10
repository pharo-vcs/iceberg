initialization
model: aMerger
	"Set the model and update the window."

	"Inlined/Copied from MorphicModel because we need to overwrite superclass' behavior"
	model ifNotNil: [aMerger removeDependent: self].
	aMerger ifNotNil: [aMerger addDependent: self].
	model := aMerger.
	
	self patchMorph model: aMerger