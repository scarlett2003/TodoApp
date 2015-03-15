//
//  ViewController.swift
//  TodoApp
//
//  Created by vialley-imac on 2015/3/13.
//  Copyright (c) 2015年 ookiwi. All rights reserved.
//

import UIKit

var todos: [TodoModel] = []

//轉換日期類型
func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-mm-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //先初始化值
        todos = [TodoModel(id: "1", image: "child-selected", title: "1.去遊樂場", date: dateFromString("2014-11-2")!),
            TodoModel(id: "2", image: "shopping-cart-selected", title: "2. 购物", date: dateFromString("2014-10-28")!),
            TodoModel(id: "3", image: "phone-selected", title: "3. 打电话", date: dateFromString("2014-10-30")!),
            TodoModel(id: "4", image: "travel-selected", title: "4. Travel to Europe", date: dateFromString("2014-10-31")!)]
        
        // 新增navigationItem
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // mark - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell
        
        var todo = todos[indexPath.row] as TodoModel
        
        var image = cell.viewWithTag(101) as UIImageView
        var title = cell.viewWithTag(102) as UILabel
        var date = cell.viewWithTag(103) as UILabel
        
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-mm-dd", options: 0, locale: locale)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.stringFromDate(todo.date)
        
        
        return cell
    }
    
    
    // mark UITableViewDelegate 使用手勢刪除row資料
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

    // edit Mode
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    
    
    
}

