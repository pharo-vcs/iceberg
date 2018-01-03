printing
longDescription
	
	^  'The working copy in the image is not positioned in the same commit as the repository.
Proceed to synchronize them to commit. This can be done in three ways:
	- (Recommended) Set the repository commit to the image commit ({1}).
	- Load the repository commit ({2}) in the image, overriding your changes.
	- (Dangerous) Change the image commit to the repository commit ({2}) without modifying the loaded code.' format: { self workingCopyCommitName. self repositoryCommitName }.