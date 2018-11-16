tests
testRepositoryHasNoProjectFile

	self deny: (self repository location / '.project') exists