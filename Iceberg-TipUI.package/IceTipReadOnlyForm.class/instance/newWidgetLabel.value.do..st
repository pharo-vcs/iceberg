private factory
newWidgetLabel: labelString value: textOrString do: aBlock
	| index labelId valueId |
	
	index := items indexOfKey: labelString.

	labelId := ('label_', index asString) asSymbol.
	valueId := ('value_', index asString) asSymbol.
	widgets at: labelId put: (self newLabel: labelString).
	widgets at: valueId put: (self newValue: textOrString).	
	aBlock value: labelId value: valueId