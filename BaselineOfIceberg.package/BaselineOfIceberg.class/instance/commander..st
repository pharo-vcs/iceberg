baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://pharo-ide/Commander:v0.8.0/src';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]