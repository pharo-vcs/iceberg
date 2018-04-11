accessing
projectClass
	^ super projectClass 
	"this is breaking the bootstrap. Reverting it for now."
	"[ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]"