//
//  CatViewModel.swift
//  ProjectFinal
//
//  Created by The Dat on 7/15/21.
//

import Foundation
import QNetwork

class CatViewModel {
    
    //MARK: - Bien
    let service: CatService!
    var needReloadTableView: (() -> Void)?
    var needShowError: ((BaseError) -> Void)?

    //MARK: - Datasource
    private var catResponse: [CatResponse] = []

    //MARK: - init
    init() {
        self.service = CatService(isTest: false)
    }

    
    //MARK: - func
    func requestRepositories(loadMore: Bool = false) {
        if !loadMore {
            self.catResponse.removeAll()
        }
        
        self.service.catRepositories() { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let catResponses):
                strongSelf.catResponse.append(catResponses)
                strongSelf.needReloadTableView?()
            case .failure(let error):
                strongSelf.needShowError?(error)
            }
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return catResponse.count
    }

    func cellForRowAt(indexPath: IndexPath) -> CatResponse {
        if indexPath.row == self.catResponse.count - 1 {
            self.requestRepositories(loadMore: true)
        }
        return catResponse[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) -> CatResponse {
        return catResponse[indexPath.item]
    }
}
