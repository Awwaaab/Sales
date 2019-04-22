//
//  ReportsViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 22/4/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
//
//  VisitViewModel.swift
//  Sales
//
//  Created by Awab Aly-mac on 17/1/19.
//  Copyright © 2019 Awab Aly-mac. All rights reserved.
//
import UIKit



class ReportsViewMode {
    
    
    //MARK: properties
    private var client : APIClient
    var visits : [Visit] = []
    
    //MARK: UI
    
    var showError : ((Error) -> Void)?
    var reloadData : (() -> Void)?
    
    
    init(client : APIClient) {
        self.client = client
    }
    
    
    func fetchReportVisits(startDate : String , endDate : String){
        if let client = client as? Unsplash{
            let endpoint = unsplashEndpoint.visitReport(start_date: startDate, end_date: endDate, client_id: "4")
            client.fetechClients(with: endpoint, completion: { (either : Either<visitRoot>) in
                switch either {
                case .success(let rootVisits):
                    self.visits = rootVisits.visits
                    print(self.visits)
                    self.reloadData?()
                case .error(let error):
                    self.showError!(error)
                }
            })
        }
    }
    
    
    
    
    
}
