private
columnTitleFor: column
	column id = #target_url ifTrue: [ ^ '' ].
	^ super columnTitleFor: column