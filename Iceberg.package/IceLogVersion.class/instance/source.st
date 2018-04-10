accessing
source
	^ String streamContents: [ :stream | 
		stream 
			<< '"protocol: ' << self definition category << '"'; cr;
			<< self definition sourceCode ]