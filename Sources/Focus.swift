struct Focus {

    /**
     Responsible for handling pass and fail.
     */
    public static var reporter: Reportable? = DefaultReporter.sharedReporter
}

public func expect<Item>(_ item: Item) -> Expect<Item> {
    return Expect(item: item)
}

public func set(reporter: Reportable) {
    Focus.reporter = reporter
}
