testing
isModified
	"We consider package as modified if there is no working copy (which means package is new in 
	 repository) or working copy is modified"
	| workingCopy |
	workingCopy := self mcWorkingCopy.
	^ workingCopy isNil or: [ workingCopy modified ]