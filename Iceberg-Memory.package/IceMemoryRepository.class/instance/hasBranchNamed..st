testing
hasBranchNamed: aString 
	
	"This could be optimized at the cost of complicating a bit the code.
	It is not worth it yet."
	
	[ self branchNamed: aString. ^ true ] on: IceBranchNotFound do: [ ^ false ]