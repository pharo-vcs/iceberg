private
try: aBlock onSuccess: successBlock onFailure: failureBlock
	| pos |
	
	pos := stream position.
	[ ^ successBlock value: aBlock value ]
	on: ShoalParseError 
	do: [ :e | 
		stream position: pos.
		^ failureBlock value ]. 
	