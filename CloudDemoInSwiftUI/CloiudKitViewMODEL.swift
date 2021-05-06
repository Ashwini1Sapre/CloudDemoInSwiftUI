//
//  CloiudKitViewMODEL.swift
//  CreateCloudKitDEmo
//
//  Created by Knoxpo MacBook Pro on 06/05/21.
//

import Foundation
import CloudKit


class CKClass {
    static let db = CKContainer.default().publicCloudDatabase
    
    class func fetch(completion: @escaping (Result<[Shoe],Error>) -> ()) {
        let predicate = NSPredicate(value: true)
        let name = NSSortDescriptor(key: "name", ascending: true)
        let query = CKQuery(recordType: "shoe", predicate: predicate)
        query.sortDescriptors = [name]
        
        let opration = CKQueryOperation(query: query)
        opration.desiredKeys = ["brand","name","size"]
        opration.resultsLimit = 50
        
        var newShoe = [Shoe]()
        
        opration.recordFetchedBlock = { record in
            var shoe = Shoe()
            shoe.recordID = record.recordID
            shoe.name = record["name"] as! String
            shoe.brand = record["brand"] as! String
            shoe.size = record["size"] as! Int
            newShoe.append(shoe)
        }
        opration.queryCompletionBlock = { (cursor,error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    
                    completion(.failure(error))
                }
                else{
                    
                    completion(.success(newShoe))
                }
              
            }
           
        }
        db.add(opration)
      
    }
    
    
}
