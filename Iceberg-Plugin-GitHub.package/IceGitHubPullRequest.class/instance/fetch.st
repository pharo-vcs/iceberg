actions
fetch
	[ ^ self repository fetchFrom: self remote ]
	ensure: [ fetched := true ]