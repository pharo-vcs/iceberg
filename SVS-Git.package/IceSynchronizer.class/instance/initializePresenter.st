initialization
initializePresenter
	changes whenHighlightedItemChanged: [ :node |
		node ifNotNil: [node content updateDiff: self diff ]].
