//
//  CHAT+CoreDataProperties.swift
//  
//
//  Created by Sierra 4 on 15/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CHAT {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CHAT> {
        return NSFetchRequest<CHAT>(entityName: "CHAT");
    }

    @NSManaged public var lbl1Chat: String?
    @NSManaged public var lbl2Chat: String?

}
