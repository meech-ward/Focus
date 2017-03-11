public struct Focus {

    public static var failureHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))?
    public static var successHandler: ((_ file: StaticString, _ line: UInt) -> (Void))?
    
    public static var reporter: Reportable?
}

public func expect<Item>(_ item: Item) -> Expect<Item> {
    return Expect(item: item)
}
