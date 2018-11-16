accessing
diff
	
	^ diff ifNil: [ 
		diff := committish diffTo: self workingCopy ].