private factory
createCheckoutBranchTypes
	| allTypes |
	allTypes := IceTipCheckoutBranchPanel allTypesOn: self model.
	"I'm doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self window delete ] ].
	^ allTypes