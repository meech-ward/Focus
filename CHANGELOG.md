# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- The following sections to README:
	* Requirements
	* How To Use
	* Matchers
	* Features
	* Contributing
- An `ISSUE_TEMPLATE.md` file to have a template for for bugs, enhancements or optimizations, and new features.
- An MIT `LICENSE` document.
- A Contributing file with the following sections:
	* What should I know before I get started?
	* How Can I Contribute?
	* Styleguides
	* Code of Conduct

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