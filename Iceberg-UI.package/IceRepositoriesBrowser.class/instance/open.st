scripting opening
open
	IceRepository defaultBackend 
		verifyBackendAvailabilityIfNot: [ :requiredVersion :currentVersion | 
			^ UIManager default 
				alert: ('This version of Iceberg requires libgit2 {1} to run (you have {2}).
Please update your PharoVM before continue.' format: { requiredVersion. currentVersion }) ].
	self openOn: Object new