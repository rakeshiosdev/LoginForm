
//
//  ManageCoreData.swift
//  MyForm
//
//  Created by RakeshPC on 11/07/19.
//  Copyright © 2019 RakeshPC. All rights reserved.
//

import Foundation
import CoreData

struct ManageCoreData {
    
    let context = appdelegate.persistentContainer.viewContext
    
    //MARK: InsertData
    func insertUserRecord(dictData: [String:Any]) {
        let entity = NSEntityDescription.entity(forEntityName: "UserDetail", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        print(dictData)
        newUser.setValue(dictData[PredifineKeys.nameKey], forKey: PredifineKeys.nameKey)
        newUser.setValue(dictData[PredifineKeys.emailKey], forKey: PredifineKeys.emailKey)
        newUser.setValue(dictData[PredifineKeys.phoneKey], forKey: PredifineKeys.phoneKey)
        newUser.setValue(dictData[PredifineKeys.passwordKey], forKey: PredifineKeys.passwordKey)
        
        do {
            try context.save()
        } catch {
            print("Failed save")
        }
    }
    
    //MARK:CheckUserExist
    func checkUserExist(email:String) -> Bool{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetail")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "\(PredifineKeys.emailKey) == %@", email)
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if let _ = data as? UserDetail{
                    return  true
                }
            }
            
        } catch {
            
            print("Failed")
        }
        return false
    }
    
}
