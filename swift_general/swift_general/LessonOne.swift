//
//  LessonOne.swift
//  swift_general
//
//  Created by Павел Чернышев on 02.01.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import Foundation

/*
1. Решить квадратное уравнение.

2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
*/
class LessonOne : Lesson {
    func start() {
        print("Введите сумму вклада")
        if let userEnter = readLine() {
            if var depositSum = Double(userEnter) {
                print("Введите годовой процент по вкладу")
                if let userEnter2 = readLine() {
                    if var procent = Double(userEnter2) {
                        procent = procent / 100
                        var count: Int = 0
                        let year: Int = 5
                        while count < year {
                            depositSum = depositSum + depositSum * procent
                            count = count + 1
                        }
                        print(depositSum)
                    }
                }
            }
        }

        print("Enter (a) coefficient: ")
        if let userEnter = readLine() {
        let aCoefficient = Int(readLine(strippingNewline: true) ?? "") ?? 0
        print("Enter (b) coefficient: ")
        let bCoeficient = Int(readLine() ?? "") ?? 0
        print("Enter (c) coefficient: ")
        let cCoefficient = Int(readLine() ?? "") ?? 0
        let descrim = (bCoeficient * bCoeficient) - (4 * aCoefficient * cCoefficient)
        print(descrim)

        }
    }
}
