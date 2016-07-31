auxiliar
lastCommits: howMany
	| lines commits |
	lines := (self gitCommand: ('rev-list -{1} --pretty=%s --parents HEAD' format: { howMany })) trim lines.
	commits := OrderedCollection new.
	
	1 to: howMany do: [ :i |
		| ids |
		ids := (' ' split: (lines at: i * 2 - 1)) allButFirst.
		commits add: (IceTestCommitInfo new
			id: (ids at: 1);
			parentIds: ids allButFirst;
			message: (lines at: i * 2);
			yourself)
	].

	^ commits