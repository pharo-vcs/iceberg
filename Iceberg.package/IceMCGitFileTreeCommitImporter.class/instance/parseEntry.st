private
parseEntry
	| logSize commitID author position parents message dateAndTime |

	(commitIDs match: 'log size ') ifFalse: [ self error: 'Unable to find git data in input' ].
	
	logSize := (commitIDs upTo: $|) trimBoth asInteger.
	position := commitIDs position.
	commitID := (commitIDs upTo: $|) trimBoth.
	author := (commitIDs upTo: $|) onlyLetters.
	dateAndTime := DateAndTime fromString: (commitIDs upTo: $|).
	parents := (commitIDs upTo: $|) trimBoth substrings asOrderedCollection
		collect: [ :parent | self getParent: parent ].
	message := (commitIDs next: logSize + position - commitIDs position) convertFromSystemString.

	^ GitFileTreePackageEntry new
		packageDirectory: package directoryName;
		commitID: commitID;
		author: author;
		message: message;
		timeStamp: dateAndTime;
		parents: parents;
		repository: repository;
		yourself.
