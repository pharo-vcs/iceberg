actions
accept
	self removeFileSystemCheckbox state 
		ifTrue: [ self model delete ]
		ifFalse: [ self model forget ]