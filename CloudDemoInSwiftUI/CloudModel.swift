//
//  CloudModel.swift
//  CreateCloudKitDEmo
//
//  Created by Knoxpo MacBook Pro on 06/05/21.
//

import Foundation
import CloudKit



class Shoes: ObservableObject{
    
    
    @Published var list: [Shoe] = []
    
}


struct Shoe : Identifiable {
    
    var id = UUID()
    
    var recordID: CKRecord.ID?
    var name: String = ""
    var brand: String = ""
    var size: Int = 0
    
    
    
    
    
}
