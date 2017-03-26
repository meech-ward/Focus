struct Focus {
    
    /**
     Responsible for handling pass and fail.
     */
    static var reporter: Reportable? = defaultReporter()
}

public func expect<Item>(_ item: Item) -> Expect<Item> {
    return Expect(item: item)
}

public func set(reporter: Reportable) {
    Focus.reporter = reporter
}

public func defaultReporter() -> DefaultReporter {
    return DefaultReporter.sharedReporter
}
