//
//  NetworkService.swift
//  Guidomia-iOS
//
//  Created by chaouki bencherif on 13/10/2022.
//

import Foundation

struct NetworkService {

    static func loadJson(filename fileName: String) -> [Car]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode([Car].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
