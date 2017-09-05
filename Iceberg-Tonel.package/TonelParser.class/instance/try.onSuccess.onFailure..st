private parsing
try: aBlock onSuccess: successBlock onFailure: failureBlock
	| pos |
	
	pos := stream position.
	[ ^ successBlock value: aBlock value ]
	on: TonelParseError 
	do: [ :e | 
		stream position: pos.
		^ failureBlock value ]. 
	