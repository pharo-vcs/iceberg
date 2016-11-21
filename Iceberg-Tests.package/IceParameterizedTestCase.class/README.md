I am a test case that is run several times with different configuration. Each configuration is defined by a set of IceParameterValué's. Possible values are defined in IceParameter objects, which in turn are provided by my #parameters class method, which should be overriden by my subclasses.

If #parameters method is not overriden, I will be run as a normal test case.
