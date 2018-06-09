tagging
createTag: aString thenDo: aBlockClosure 
	<noCache>

	IceTipStandardAction new 
		repository: self entity;
		message: ('Creating tag {1} on commit {2}' format: { aString. self commit shortId });
		onSuccessRepositoryModified;
		execute: [ | branch |
			branch := self commit createTag: aString.
			aBlockClosure value: branch ]
	