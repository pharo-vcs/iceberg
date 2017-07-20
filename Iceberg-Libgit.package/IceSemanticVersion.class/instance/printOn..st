printing
printOn: stream 
	stream 
		<< self major asString 
		<< '.' << self minor asString 
		<< '.' << self patch asString