//
//  NewTaskViewController.swift
//  TaskCountDownUIKit
//
//  Created by Thor on 22/08/2021.
//

import UIKit

class NewTaskViewController : UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var minuteTextField: UITextField!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var nameDescriptionContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    var taskViewModel : TaskViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskViewModel = TaskViewModel()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(
            UINib(nibName: TaskTypeCollectionViewCell.description(),
                  bundle: .main), forCellWithReuseIdentifier: TaskTypeCollectionViewCell.description()
        )
        
    }
    
    
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        print("multiply Button Pressed")
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        print("start Button Pressed")
    }
}


extension NewTaskViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskViewModel.getTaskTypes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 3.75
        let width: CGFloat = collectionView.frame.width
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let adjustWidth = width - (flowLayout.minimumLineSpacing * (columns - 1))
        
        return CGSize(width: adjustWidth / columns, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskTypeCollectionViewCell.description(), for: indexPath) as! TaskTypeCollectionViewCell
        
        cell.setUpCell(taskType: self.taskViewModel.getTaskTypes()[indexPath.item], isSelected: taskViewModel.getSelectedIndex() == indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.taskViewModel.setSelectedIndex(to: indexPath.item)
    }
}
