# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added

### Changed


## [0.1.0] - 2016-12-21
### Added
- A faliure and success handler that will be called when a *to* evalutaion is succesfull or fails. These are supposed to be injected by the application using this framework.
- A `FocusTo` struct that accepts an item`: Any` that can then be evaluated.
- The following evaluations: 
	* `fail()`
	* `pass()`
	* `beTrue()`
- A `FocusExpect` struct that accepts an item`: Any` and passes it to a `FocusTo` instance. This struct only exists for a DSL syntax: `expect(true)to.beTrue()`

### Changed


