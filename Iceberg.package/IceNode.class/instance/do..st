enumerating
do: aBlockClosure 
	
	aBlockClosure value: self value.
	self childrenDo: [ :node | node do: aBlockClosure ]