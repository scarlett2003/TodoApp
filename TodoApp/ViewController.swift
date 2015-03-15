//
//  ViewController.swift
//  TodoApp
//
//  Created by vialley-imac on 2015/3/13.
//  Copyright (c) 2015年 ookiwi. All rights reserved.
//

import UIKit

var todos: [TodoModel] = []

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //先初始化值
        todos = [TodoModel(id: "1", image: "child-selected", title: "1.去遊樂場", date: dateFromString("2014-11-2")!)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

