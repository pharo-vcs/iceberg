private parsing
untilExcluding: aCollection
	| result |
	result := stream upToAll: aCollection.
	stream position: stream position - aCollection size.
	^ result