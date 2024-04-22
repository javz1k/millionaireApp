//
//  UserDefaultsHelper.swift
//  millionaireApp
//
//  Created by Cavidan Mustafayev on 11.01.24.
//

import Foundation

final class UserDefaultsHelper {
    
    static let defaults = UserDefaults.standard
    
    //setters
    static func setObject(key:String, value:Any?){
        defaults.set(value,forKey:key)
        defaults.synchronize()
    }
    
    static func setString(key:String, value:String){
        defaults.set(value,forKey: key)
        defaults.synchronize()
    }
    
    static func setBool(key:String, value:Bool){
        defaults.setValue(value, forKey: key)
        defaults.synchronize()
    }
    // custom setter
    static func setCustom<T: Encodable>(value: T?, key:String){
        let jsonData = try? JSONEncoder().encode(value)
        defaults.set(jsonData, forKey: key)
        defaults.synchronize()
    }
    
    
    
   
    
    //getters
    static func getObject(key: String) -> Any? {
        return defaults.object(forKey: key)
    }

    
    static func getString(key:String) -> String? {
        return defaults.string(forKey: key)
    }
    
    static func getBool(key:String) -> Bool{
        return defaults.bool(forKey: key)
    }
    
    //custom getter
    static func getCustom<T: Decodable>(key:String) -> T? {
        guard let data = defaults.data(forKey: key) else  { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
   
    
    
    
    // remove
    static func remover(key:String){
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
}
