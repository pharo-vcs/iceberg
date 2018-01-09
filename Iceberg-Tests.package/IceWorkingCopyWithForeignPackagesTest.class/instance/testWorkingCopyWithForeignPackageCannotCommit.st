tests
testWorkingCopyWithForeignPackageCannotCommit

	self should: [repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 