snapshotting
snapshotFrom: aVersion
	
	| snapshot |
	snapshot := IceSnapshot new.
	self changes do: [ :e |
		e fillSnapshot: snapshot fromVersion: aVersion ].
	^ snapshot