

This [video](https://youtu.be/yGr5HvVWM0M) shows how to contribute to iceberg.
For this, you should update your iceberg installation and then just do a pull request.
This means that you need to start by forking https://github.com/pharo-vcs/iceberg

- Path 1: Clone and pull (easy)
  - Clone your fork
  - Checkout the latest development branch (e.g., dev-0.7)
  - Pull from pharo-vcs/iceberg
  
  This path does not always work, as this is kind of self-brain surgery. Iceberg is updating itself.
  If this does not work, go to path 2
  
- Path 2: Install from scratch (if Path 1 does not work)
  - Use the script in the README file to unload and reinstall iceberg
  - Make sure you use the latest development branch in the Metacello script (e.g., dev-0.7)
  - Clone your fork and checkout the development branch
  
Once you have the correct version, you can load the tests by loading the development group of the baseline.