//
//  AppsService.swift
//  App Store
//
//  Created by Frederico Augusto on 12/09/20.
//  Copyright © 2020 Frederico Augusto. All rights reserved.
//

import Foundation

class AppsService {
    
    static let shared = AppsService()
    
    let API = "https://api.euprogramador.app/app-store/v1"
    
    func buscaAppsEmDestaque (completion: @escaping ([AppDestaque]?, Error?) -> ()) {
        
        guard let url = URL(string: "\(API)/apps/apps-em-destaque") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode([AppDestaque].self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    func buscaGrupo (tipo: String, completion: @escaping (AppGrupo?, Error?) -> ()) {
        
        guard let url = URL(string: "\(API)/apps/\(tipo)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else {return}
                let apps = try JSONDecoder().decode(AppGrupo.self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
