*Iceberg-Tests
asTestParameterValue
	"This allows to run a test case agains all known Iceberg backends"
	^ IceTestParameterValue new 
		value: self;
		target: IceOldRepository;
		selector: #defaultBackend