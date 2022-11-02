//
//  MeterDataManager.swift
//  SomeCoreData
//
//  Created by Evgen on 01/11/2022.
//  Copyright © 2022 Evgen. All rights reserved.
//

import Foundation
import CoreData

class MeterDataManager : DataManager {
    
    func createMeter(_ type: MeterType, value: Decimal) {
        
        let meter = Meter(context: persistentContainer.viewContext)
        
        switch type {
            case .gas:
                meter.name = "Газ"
                meter.type = Int16(MeterType.gas.rawValue)
            case .electro:
                meter.name = "Электричество"
                meter.type = Int16(MeterType.electro.rawValue)
            case .water:
                meter.name = "Вода"
                meter.type = Int16(MeterType.water.rawValue)
        default:
            return
        }
        
        meter.value = value as NSDecimalNumber
        
        saveContext()
    }
    
    ///<summary>
    ///Возвращает все найденные данные в указанном количестве
    ///</summary>
    func get(count: Int, _ offset: Int? = nil) -> [Meter]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: String(describing: Meter.self))
        fetchRequest.fetchLimit = count
        fetchRequest.fetchOffset = offset ?? 0
        
        let result = try? persistentContainer.viewContext.fetch(fetchRequest) as? [Meter]
        
        return result
    }
    
    ///Возвращает значение по индексу.
    func getByIndexOrDefault(_ index: Int) -> Meter? {
        if let meters = get(count: index+1), meters.count >= index+1 {
            return meters[index]
        }
        return nil
    }
    
    ///Удаляет по индексу
    func deleteByIndex(_ index: Int) {
        guard let meter = getByIndexOrDefault(index) else {
            return
        }
        
        try? persistentContainer.viewContext.delete(meter)
        saveContext()
    }
}
