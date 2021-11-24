//
//  ViewController.swift
//  Skeleton
//
//  Created by IMAC on 24.11.21.
//

import UIKit
import SkeletonView

class ViewController: UIViewController, SkeletonTableViewDataSource {
   
    
    
    @IBOutlet var tableView: UITableView!
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        tableView.dataSource = self
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            for _ in 0..<30 {
                self.data.append("Do incredible things on the go. Visualize 3D projects using augmented reality. Collaborate with your team on Keynote presentations. And stay connected with FaceTime, Messages, and Mail.")
            }
            
            self.tableView.stopSkeletonAnimation()
            
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.3))
            
            self.tableView.reloadData()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .link), animation: nil, transition: .crossDissolve(0.25))
        tableView.showAnimatedSkeleton(usingColor: .purple, transition: .crossDissolve(0.5))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        
        return MyTableViewCell.identifier
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                 MyTableViewCell.identifier,
                                                 for: indexPath) as! MyTableViewCell
        
        if !data.isEmpty {
            cell.myLabel.text = data[indexPath.row]
            cell.myImageView.image = UIImage(systemName: "pencil")
        }
        return cell
        
    }
}

