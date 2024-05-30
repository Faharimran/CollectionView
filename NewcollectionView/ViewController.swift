//
//  ViewController.swift
//  NewcollectionView
//
//  Created by College on 27/05/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var data = ["🐤","🕷️","🦄","🐴","🐬","🦧","🐩","🐪","🐓","🐿️","🦔","🦩","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐤","🐁","🦦","🪶","🐤","🐤","🐖","🐤","🐲","🦉","🐤","🪱"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView.allowsMultipleSelection = editing
        collectionView.indexPathsForVisibleItems.forEach{(indexPath) in let cell = collectionView.cellForItem(at: indexPath) as! CustomCelll
            cell.isEditing = isEditing}
    }
    @IBAction func addNewItem() {
        insertMultipleItems()
    }
    
    func insertOneItem() {
        var text = "🦬"
        data.append(text)
        let indexPath = IndexPath(row: data.count - 1 , section: 0)
        collectionView.insertItems(at: [indexPath])
    }
    
    func insertMultipleItems(){
        collectionView.performBatchUpdates({
            for _ in 0..<5 {
                var text = "🦬"
                data.append(text)
                let indexPath = IndexPath(row: data.count - 1 , section: 0)
                collectionView.insertItems(at: [indexPath])}
        }, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedItem = sender as? String else{
            return
        }
        if segue.identifier == "detail"{
            guard let destinationVC = segue.destination as? DataViewController  else{
                return
            }
            destinationVC.selectedData = selectedItem
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCelll
//        if let label = cell.viewWithTag(100) as? UILabel {
//            label.text = data[indexPath.item]
//        }
        
        cell.itemLabel.text = data[indexPath.item]
        cell.isEditing = isEditing
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numbOfCell = 3
        let width = (self.view.frame.size.width - (CGFloat(numbOfCell-1) * 10)) / CGFloat (numbOfCell)
        return CGSize(width: width, height: width)
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = data[indexPath.item]
        self.performSegue(withIdentifier: "detail", sender: selectedData)
    }


}



