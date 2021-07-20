//
//  CatService.swift
//  ProjectFinal
//
//  Created by The Dat on 7/16/21.
//

import Foundation
import QNetwork

final class CatService: QBaseService {

    
    //MARK: - func call api
    func catRepositories(completion: @escaping (Result<CatResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(API.catRepositories), type: CatResponse.self) { result in
            completion(result)
        }
    }
}
