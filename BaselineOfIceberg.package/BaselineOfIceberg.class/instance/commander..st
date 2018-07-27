baseline
commander: spec
	spec 
		baseline: 'Commander' 
		with: [ 
			spec 
				repository: 'github://pharo-ide/Commander:v0.6.3';
				loads: #('Core' 'AllActivators' 'Commander-SpecSupport') ]