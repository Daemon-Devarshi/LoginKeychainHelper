//
//  SecureCredentials.swift
//  Copyright Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import Foundation

public struct SecureCredentials : Codable {
    public var userId: String
    public var userName: String
    public var userPassword: String
    public var firebaseUID: String
    public var gToken: String
    public var fbToken: String
    
    
    public func data() throws -> Data{
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            return try encoder.encode(self)
        }
        catch {
            throw error
        }
    }
    
    public init(userId: String, userName: String, userPassword: String, firebaseUID: String,gToken:String,fbToken:String) {
        self.userId = userId
        self.userPassword = userPassword
        self.userName = userName
        self.firebaseUID = firebaseUID
        self.gToken = gToken
        self.fbToken = fbToken
    }
    
    public init(data: Data) throws {
        do {
            let decoder = JSONDecoder()
            self = try decoder.decode(SecureCredentials.self, from: data)
        }
        catch {
            throw error
        }
    }
}
