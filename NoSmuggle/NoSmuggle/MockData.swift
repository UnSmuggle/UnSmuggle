//
//  MockData.swift
//  NoSmuggle
//
//  Created by Stefan Fessler on 16.11.19.
//  Copyright © 2019 Stefan Fessler. All rights reserved.
//

import UIKit

class MockData: NSObject {
    
    class var shared: MockData {
        
        struct Singleton {
            
            static let instance = MockData()
        }
        
        return Singleton.instance
    }
    
    override init() {
        
    }
    
    var rendData: [Luggage] = [Luggage(title: "Suspexted Animal\n\nFrom: IST\nArrival: 12:00\nDate: 16 Nov\nBelt 1", imageName: "animal"),
                               Luggage(title: "Suspexted Move\n\nFrom: DXB\nArrival: 12:00\nDate: 16 Nov\nBelt 2", imageName: "move"),
                               Luggage(title: "No scan\n\nFrom: DXB\nArrival: 13:00\nDate: 16 Nov\nBelt 5", imageName: "noscan"),
                               Luggage(title: "Normal\n\nFrom: JFK\nArrival: 13:00\nDate: 16 Nov\nBelt 4", imageName: "luggage"),
                               Luggage(title: "Suspexted Animal\n\nFrom: BHK\nArrival: 13:00\nDate: 16 Nov\nBelt 5", imageName: "animal"),
                               Luggage(title: "Suspexted Move\n\nFrom: DXB\nArrival: 13:00\nDate: 16 Nov\nBelt 3", imageName: "move"),
                               Luggage(title: "Normal\n\nFrom: LON\nArrival: 15:00\nDate: 16 Nov\nBelt 6", imageName: "luggage"),
                               Luggage(title: "Normal\n\nFrom: DXB\nArrival: 16:00\nDate: 16 Nov\nBelt 8", imageName: "luggage"),
                               Luggage(title: "Normal\n\nFrom: JFK\nArrival: 17:00\nDate: 16 Nov\nBelt 1", imageName: "luggage"),
                               Luggage(title: "Normal\n\nFrom: ROM\nArrival: 05:50\nDate: 17 Nov\nBelt 3", imageName: "luggage"),
                               Luggage(title: "Normal\n\nFrom: IST\nArrival: 06:00\nDate: 17 Nov\nBelt 2", imageName: "luggage")]
    
    var checkData: [Luggage] = []
    var historyData: [Luggage] = []
}

class Luggage: NSObject {
    
    let uuid: UUID = UUID()
    let title: String
    let imageName : String
    let packageID: String = String.random(length: 10)
    
    init(title: String, imageName: String) {
        
        self.title = title
        self.imageName = imageName
    }
}

extension String {

    static func random(length: Int = 10) -> String {
        let base = "0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
