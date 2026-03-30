//
//  DictionaryCoreTests.swift
//  Lab 5 Task 6
//
//  Author: Vanya Nasennik
//

import DictionaryCore
import Testing

@Test
func soldiersStartEmpty() {
    let service = MilitaryDictionaryService()

    #expect(service.soldierCount() == 0)
}

@Test
func departmentsStartWithInitialData() {
    let service = MilitaryDictionaryService()

    #expect(service.departmentCount() == 3)
    #expect(service.department(forKey: "D-101")?.position == "Commander")
}

@Test
func soldierSortingBySalaryWorks() {
    let service = MilitaryDictionaryService()
    service.addSoldier(key: "S-2", name: "Ivanov", salary: 1700)
    service.addSoldier(key: "S-1", name: "Petrov", salary: 1500)

    let result = service.sortedSoldiersByValue()

    #expect(result.map(\.0) == ["S-1", "S-2"])
}

@Test
func clearOperationsRemoveAllValues() {
    let service = MilitaryDictionaryService()
    service.addSoldier(key: "S-1", name: "Petrov", salary: 1500)
    service.clearSoldiers()
    service.clearDepartments()

    #expect(service.soldierCount() == 0)
    #expect(service.departmentCount() == 0)
}
