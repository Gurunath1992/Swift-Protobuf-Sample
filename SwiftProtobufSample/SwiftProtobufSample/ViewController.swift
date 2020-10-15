//
//  ViewController.swift
//  SwiftProtobufSample
//
//  Created by Gurunath Sripad on 10/14/20.
//  Copyright © 2020 sripad.gurunath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var employee = Employee()
        employee.age = 25
        employee.name = "John Appleseed"
        employee.salary = 1000
        
        print("Employee object created.",
              "\n Age \(employee.age)",
            "\n Name \(employee.name)",
            "\n Salary \(employee.salary)"
        )
        do {
            let employeeBytes = try employee.serializedData()
            print("employee object in bytes: \(employeeBytes as NSData)")
            
            let newEmployeeObject = try Employee.init(serializedData: employeeBytes)
            print("New Employee object created from the byte array.",
                  "\n Age \(newEmployeeObject.age)",
                "\n Name \(newEmployeeObject.name)",
                "\n Salary \(newEmployeeObject.salary)"
            )
        } catch (let error) {
            print("Failed to serialize employee object")
        }
        
    }
    
    
}

