initialization
initializeNextTagPanel
	| parts prefix nextMajor nextMinor nextPatch toString |
	parts := self latestTagParts.
	prefix := parts first.
	parts := parts allButFirst.
	toString := [ :arr | (arr collect: #asString) joinUsing: '.' ].
	nextMajor := prefix , (toString value: (Array with: parts first + 1 with: 0 with: 0)).
	nextMinor := prefix
		, (toString value: (Array with: parts first with: parts second + 1 with: 0)).
	nextPatch := prefix
		, (toString value: (Array with: parts first with: parts second with: parts third + 1)).
	majorButton := self newButton
		label: 'major (' , nextMajor , ')';
		action: [ tagNameInputText text: nextMajor ].
	minorButton := self newButton
		label: 'minor (' , nextMinor , ')';
		action: [ tagNameInputText text: nextMinor ].
	patchButton := self newButton
		label: 'patch (' , nextPatch , ')';
		action: [ tagNameInputText text: nextPatch ]