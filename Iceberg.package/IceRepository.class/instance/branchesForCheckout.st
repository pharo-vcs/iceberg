querying
branchesForCheckout
	"Returns a list of the most useful branches for being checked out"
	| branchNames branches |
	branchNames := self backend allBranchNames.
	branches := OrderedCollection new.
	branchNames do: [ :name || newBranch | 
		newBranch := IceBranch named: name inRepository: self.
		(newBranch isLocal or: [ branches noneSatisfy: [:b | b simpleName = newBranch simpleName ]])
			ifTrue: [ branches add: newBranch ] 
	].

	^ branches