*Iceberg-UI
pathAsString
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]