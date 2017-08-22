//
//  ViewController.swift
//  StepsDemo
//
//  Created by Higher Visibility on 22/08/2017.
//  Copyright © 2017 HigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var addressView: UIView!
    var myview = UIView()
    var closeButton = UIButton()
    var tableView = UITableView()
    
 var label:[String] = ["qwe","sfsda","xcvc","asdf","lkjh","qw234","tutyur"]
    var detailsLabel = ["qwertyuiop","asdfghjkl","zxcvbm","asdsafdhfgjgh","qeretrew","zvcxcv","weqrewr"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.addTapGestureView()
        print(self.addressView.layer.frame.origin.x)
        print(self.addressView.layer.frame.origin.y)
        print(self.addressView.frame.maxX)
        print(self.addressView.frame.maxY)
        print(self.addressView.frame.minX)
        print(self.addressView.frame.minY)
        print(self.addressView.frame.midX)
        print(self.addressView.frame.midY)
        
        
    }

    private func addTapGestureView(){
        
        let tab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showSteps))
        tab.numberOfTapsRequired = 1
        self.addressView.isUserInteractionEnabled = true
        self.addressView.addGestureRecognizer(tab)
        
    }
    
    func showSteps(){
        
        print("ShowSteps")
        let y = self.addressView.frame.maxY
     
        let diff = self.addressView.frame.height + self.addressView.layer.frame.origin.y
        
        let viewWidht = self.view.frame.size.width
        let viewheight = self.view.frame.size.height - diff
        
//        self.myview = UIView(frame: CGRect(x: x, y: y, width: viewWidht, height: viewheight))
//        self.myview.backgroundColor = UIColor.black
        let btnY = self.view.frame.height - 66
        
        let btnWidght = self.view.frame.size.width - 16
        self.closeButton = UIButton(frame: CGRect(x: 8, y: btnY, width: btnWidght, height: 50))
        self.closeButton.setTitle("Close", for: .normal)
        self.closeButton.setTitleColor(UIColor.white, for: .normal)
        self.closeButton.backgroundColor = UIColor.gray
        self.closeButton.addTarget(self, action: #selector(self.removeControlls), for: .touchUpInside)
        
        let tableRect = CGRect(x: 0, y: y, width: viewWidht, height: viewheight)
        self.tableView = UITableView(frame: tableRect)
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
//        self.view.addSubview(self.myview)
         self.view.addSubview(self.tableView)
         self.view.addSubview(self.closeButton)
        
    }

    func removeControlls(){
        
        self.tableView.removeFromSuperview()
        self.closeButton.removeFromSuperview()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      

    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let div = indexPath.row % 2
        if div == 0{
            let color = UIColor(red: 23/255, green: 78/255, blue: 129/255, alpha: 1)
            
            
            cell.backgroundColor = color
        }else{
            let color = UIColor(red: 48/255, green: 83/255, blue: 123/255, alpha: 1)
            
            
            cell.backgroundColor = color
            
        }
        

           }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.label.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
        cell?.textLabel?.text = self.label[indexPath.row]
        cell?.detailTextLabel?.text = self.detailsLabel[indexPath.row]
        
        
        return cell!
    }
}

