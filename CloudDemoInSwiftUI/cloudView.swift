//
//  cloudView.swift
//  CreateCloudKitDEmo
//
//  Created by Knoxpo MacBook Pro on 06/05/21.
//

import SwiftUI

struct cloudView: View {
    
    @EnvironmentObject  var shoes: Shoes
    
    
    var body: some View {
       
        List {
            
            ForEach(shoes.list , id: \.id) { shoe in
                
                Text(shoe.name)
              
            }
            
           
        }
        .onAppear(perform: loadData)
        
        
    }
    
    
    func loadData() {
        
        CKClass.fetch { (result) in
            
            
            switch result {
            
            
            case .success(let newshoe):
                self.shoes.list = newshoe
            
            case .failure(let error):
                
            print(error)
            
            }
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
}

struct cloudView_Previews: PreviewProvider {
    static var previews: some View {
        
        let lists = Shoes()

        cloudView().environmentObject(lists)
        
        
        
    }
}
