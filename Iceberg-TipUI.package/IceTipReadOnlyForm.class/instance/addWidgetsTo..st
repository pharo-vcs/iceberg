private
addWidgetsTo: column
	| last |
	last := items associations last.
	items associationsDo: [ :each | | label value |
		label := each key.
		value := each value.
		self 
			newWidgetLabel: label 
			value: value 
			do: [ :labelId :valueId |
				self 
					addRow: labelId 
					value: valueId 
					isLast: last = each
					to: column ] ]