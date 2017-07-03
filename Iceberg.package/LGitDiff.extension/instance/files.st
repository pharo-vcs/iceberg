*Iceberg-Core
files
	| deltaFiles |
	
	deltaFiles := Set new.
	self filesDo: [ :delta :ignored1 :ignored2 | 
		deltaFiles add: delta newFile path.
		0 "Continue" ].
	^ deltaFiles