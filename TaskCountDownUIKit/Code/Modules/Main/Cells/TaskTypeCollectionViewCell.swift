//
//  TaskTypeCollectionViewCell.swift
//  TaskCountDownUIKit
//
//  Created by Thor on 22/08/2021.
//

import UIKit

class TaskTypeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DispatchQueue.main.async {
            self.imageContainerView.layer.cornerRadius = self.imageContainerView.bounds.width / 2
        }
    }
    
    //    Mark:
    override class func description() -> String {
        return "TaskTypeCollectionViewCell"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
        self.imageView.image = nil
    }
    
    func setUpCell(taskType: TaskType, isSelected: Bool){
        self.typeName.text = taskType.typeName
        if(isSelected){
            self.imageContainerView.backgroundColor = UIColor(hex: "17b890").withAlphaComponent(0.5)
            self.typeName.textColor = UIColor(hex: "006666")
            self.imageView.tintColor = UIColor.white
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 26.0, weight: .medium))
        }else{
            self.imageView.image = UIImage(systemName: taskType.symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))
            reset()
            
        }
    }
    
    func reset(){
        self.imageContainerView.backgroundColor = UIColor.clear
        self.typeName.textColor = UIColor.black
        self.imageView.tintColor = UIColor.black
    }
}
