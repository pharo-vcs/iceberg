examples - change tree
exampleChangesTree2
	| ds git changes |
	git := Git new origin: 'git@github.com:npasserini/pharo-git.git'.
	changes := IceRepositoryChangeSet fromRepository: git.
	ds := FTTreeDataSource
		roots:	 (changes elements sort: [ :a :b | a name < b name ])
		children: [ :data | data elements sort: [ :a :b | a name < b name ] ].
	FTTableMorph new
		extent: 200 @ 400;
		dataSource: ds;
		openInWindow
