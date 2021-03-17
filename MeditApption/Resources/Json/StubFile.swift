//
//  StubFile.swift
//  MeditApption
//
//  Created by Talip Böke on 15.03.2021.
//

import Foundation

internal enum StubFile: String {
    case HomePageResponse
    
    internal func stubbedResponse() -> Data {
        let file = File(name: self.rawValue, extension: "json")
        guard let data = read(file) else {
            assertionFailure("Path not found for filename: \(file.name)")
            return Data()
        }
        return data
    }

    private func read(_ file: File) -> Data? {
        class TestClass: NSObject { }
        let filename = file.name
        let bundle = Bundle(for: TestClass.self)
        guard let path = bundle.path(forResource: filename, ofType: file.extension) else {
            return nil
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        return data
    }

//    internal func getURL(of file: File) -> URL? {
//        class TestClass: NSObject { }
//        let filename = file.name
//        let bundle = Bundle(for: TestClass.self)
//        guard let path = bundle.path(forResource: filename, ofType: file.extension) else {
//            return nil
//        }
//        return URL(fileURLWithPath: path)
//    }

    internal struct File: CustomDebugStringConvertible {
        internal let name: String
        internal let `extension`: String

        internal var debugDescription: String {
            return self.name + "." + self.extension
        }
    }
}
