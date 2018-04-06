accessing
name
	self flag: #pharo6. "in pharo6 there is still Object>>#name so this request will 
	not be redirected as expected (so we'll do it explicitly)"
	^ self realObject name