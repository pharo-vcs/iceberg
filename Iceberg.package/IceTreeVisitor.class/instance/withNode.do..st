visiting
withNode: anIceNode do: aBlockClosure 
	
	| previousNode |
	previousNode := currentNode.
	currentNode := anIceNode.
	aBlockClosure ensure: [ 
		currentNode := previousNode ]