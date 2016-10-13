running
runCase
	| previousBackendType | 
	previousBackendType := IceRepository defaultBackendType.
	IceRepository defaultBackendType: self backendType.
	[  super runCase ]
		ensure: [  IceRepository defaultBackendType: previousBackendType ]