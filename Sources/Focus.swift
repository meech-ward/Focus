public struct Focus {

    /**
     Responsible for handling pass and fail.
     */
    public static var reporter: Reportable?
}

public func expect<Item>(_ item: Item) -> Expect<Item> {
    return Expect(item: item)
}
