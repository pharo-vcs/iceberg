private factory
createCellMorphFor: item
	| morph rowElements |

	rowElements := OrderedCollection new.
	(self iconFor: item data) ifNotNil: [ :icon | rowElements add: icon asMorph ].
	rowElements
		add: (self formatedDisplayValueOf: item data) asMorph asReadOnlyMorph;
		addAll: (self tagMorphsFrom: self glamourPresentation for: item data).

	morph := self createInnerCellMorph.
	rowElements do: [ :each | morph addMorphBack: each ].
	^ morph				