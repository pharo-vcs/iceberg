*Iceberg
fullDefinitionString
	^ String streamContents: [:stream | 
		self printDefinitionOn: stream.
		stream cr; cr.
		stream << self comment ]