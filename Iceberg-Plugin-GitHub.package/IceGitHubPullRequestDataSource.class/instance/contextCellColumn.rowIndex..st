private
contextCellColumn: column rowIndex: rowIndex
	| context |
	context := (self elementAt: rowIndex) at: column id.
	(context includesSubstring: 'travis-ci')
		ifTrue: [ context := 'travis-ci' ].
	^ FTCellMorph new  
		addMorphBack: context asMorph;
		yourself
		