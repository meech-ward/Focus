#Focus

Focus is a BDD / TDD assertion library for Swift 3 that can be paired with any Swift testing framework. It works especially well with the [Observe](https://github.com/ObserveSocial/Observe) test framework.

Focus and [Observe](https://github.com/ObserveSocial/Observe) are *not* coupled to any other frameworks so you can include this package in your tests or your main app code.

## Requirements

 * Swift 3.0+

## How To Use

### Installing

Open your `Package.Swift` file and add the following depedency:

```swift
import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
        .Package(url: "https://github.com/ObserveSocial/Focus.git", majorVersion: 0, minor: 1)
    ]
)
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

    override func setUp() {
        super.setUp()
        Focus.failureHandler = XCTFail // Tell Focus to use XCTFail when an assertion is incorrect 
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

## Features

### BDD style

The chain-capable BDD styles provide an expressive language & readable style. A very readable style:

```swift
expect(foo).to.be.true()
```

### No Dependencies

Focus is not coupled to XCTest at all, in fact Focus will never rely on any frameworks other than `Foundation`. This allows you to specify what you want to happen when an assertion passes or fails.

This means you never have to worry about importing any other frameworks into your code. It also means that you can use this framework in your application's tests or your application's core code.

### Custom Failure Handler

If you want a test to fail using XCTest:

```swift
Focus.failureHandler = XCTFail
```

If you only want to log that the assert failed:

```swift
Focus.failureHandler = { message, file, line in
    print("😡 Fail: \(message) \(file) \(line)")
}
```

If you want the app to crash when the assert failes:

```swift
Focus.failureHandler = { message, file, line in
     abort()
}
```

### Custom Success Handler

You can also specify a custom Success Handler in the same way for when an assertion passes.

```swift
Focus.successHandler = { message, file, line in
    print("🤗 \(message) \(file) \(line)")
}
```

### Type Safety

Focus makes sure you don't compare two types that don't match:

```swift
// Does not compile:
expect(1 + 1).to.be.true()
```

## Contributing

All developers should feel welcome and encouraged to contribute to Focus, see our [CONTRIBUTING](https://github.com/ObserveSocial/Observe/CONTRIBUTING.md) document here to get involved.