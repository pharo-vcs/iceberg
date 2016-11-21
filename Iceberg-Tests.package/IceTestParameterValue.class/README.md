I represent a possible value of a test parameter.

I have the responsibility of knowing the desired value, but also how to make it accessible for the test.

Public API and Key Messages

- activate will make me available for running the test
- deactivate will restore any previous values before my activation.

Internal Representation and Key Implementation Points.
    Instance Variables
	value: <Object> The value of the parameter I represent.
	target:  <Object> An object to which we will hand this value.
	selector:	 <Symbol> A symbol which will be used to get/set the value in the target object.
	previousValue: <Object> Used to restore the state of the target object after running the test.

