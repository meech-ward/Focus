#Focus

Focus is a BDD / TDD assertion library for Swift 3 that can be paired with any Swift testing framework. It works especially well with the [Observe](https://github.com/ObserveSocial/Observe) test framework.

Focus and [Observe](https://github.com/ObserveSocial/Observe) are *not* coupled to any other frameworks so you can include this package in your tests or your main app code.

## Requirements

 * Swift 4.0+

## How To Use

### Installing

Open your `Package.Swift` file and add the following dependency:

```swift
dependencies: [
    .package(url: "https://github.com/ObserveSocial/Focus.git", from: "0.5.0")
]
```

Run `swift build` in terminal to fetch this new dependency.

### Running Tests With XCTest

1. Create a new XCTest file
2. `import Focus`
3. Specify the failure handler
4. `expect()` something

```swift
import XCTest
import Focus

class SimpleTest: XCTestCase {

    override class func setUp() {
        Focus.defaultReporter().failBlock = XCTFail
    }

    func testSomething() {
        var foo = false
        
        expect(foo)to.be.true() // This will fail. This is the equivalent of calling XCTAssertTrue(foo)
    }
  }
}
```

## Matchers

```swift
expect(foo).to.be.true()
expect(foo).to.fail()
expect(foo).to.pass()
```

## Reporter

The reporter defines how output is logged to the console. The reporter is also the place you will have to declare what happens when a test passes or fails. Because Focus is not coupled to XCTest, you have to tell it to use XCTest if you want.

Focus defines a `Reportable` protocol that you can implement in order to customize how test output is logged, and how to handle passing and failing tests. By default, Focus uses it's own very simple reporter. There is also a [Clean Reporter](https://github.com/ObserveSocial/CleanReporter) which we recommend you use.

The simplest way to get started is to use the default or clean reporter, and tell that reporter to use XCTFail when a test fails:

```swift
override class func setUp() {
    Focus.defaultReporter().failBlock = XCTFail
}
```

### Custom Reporter

If you want to build your own reporter, simply create a new type and have it conform to the `Reportable` protocol. Then tell Focus to use your custom Reporter.


```swift
import XCTest
import Observe

class MyReporter: Focus.Reportable {
    
    let sharedInstance = MyReporter()
    
    public func testPassed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        
        print(message)
    }
    
    public func testFailed(file: StaticString, method: String, line: UInt, message: String, evaluation: String) {
        
        print(message)
        XCTFail(message, file: file, line: line)
    }

}

class SimpleTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        let reporter = MyReporter.sharedInstance
        Focus.set(reporter: reporter)
    }
    
	func testSomething() {
        var foo = false
        expect(foo)to.be.true() 
    }
}

class AnotherSimpleTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        let reporter = MyReporter.sharedInstance
        Focus.set(reporter: reporter)
    }
    ...
}

```

It can be useful to have your reporter be a singleton so that you can share state across multiple tests. This will allow you to keep track of stats like the total number of tests that have passed or failed.

## Features

### BDD style

The chain-capable BDD styles provide an expressive language & readable style. A very readable style:

```swift
expect(foo).to.be.true()
```

### No Dependencies

Focus is not coupled to XCTest at all, in fact Focus will never rely on any frameworks other than `Foundation`. This allows you to specify what you want to happen when an assertion passes or fails.

This means you never have to worry about importing any other frameworks into your code. It also means that you can use this framework in your application's tests or your application's core code.

### Type Safety

Focus makes sure you don't compare two types that don't match:

```swift
// Does not compile:
expect(1 + 1).to.be.true()
```

## Contributing

All developers should feel welcome and encouraged to contribute to Focus, see our [CONTRIBUTING](https://github.com/ObserveSocial/Observe/CONTRIBUTING.md) document here to get involved.


