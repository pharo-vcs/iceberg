baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://pharo-ide/Commander:v0.7.2/src';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]