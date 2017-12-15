printing
printOn: stream
	stream 
		<< (self name ifNil: [ 'noname' ]) 
		<< ' (' << self url << ')'