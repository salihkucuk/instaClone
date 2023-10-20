//
//  FeedCell.swift
//  InstaClone
//
//  Created by MSK on 21.09.2023.
//

import UIKit
import FirebaseFirestore

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
   
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var savedButton: UIButton!
   
    var isLiked = false
    
        
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let emptyHeartImage = UIImage(named: "emptyHeart")
        heartButton.setImage(emptyHeartImage, for: .normal)
        let emptySaveImage = UIImage(systemName: "star")
        savedButton.setImage(UIImage(systemName: "star"), for: .normal)

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
  /*  @IBAction func likeButtonClicked(_ sender: Any) {
       let fireStoreDatabase = Firestore.firestore()
       
       if let likeCount = Int(likeLabel.text!) {
           
           let likeStore = ["likes" : likeCount + 1] as [String : Any]
           
           fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
           
       }
   }
   */

      
    @IBAction func likeButtonTapped(_ sender: UIButton) {

        
        if !isLiked {
            // Kullanıcı daha önce beğenmediyse
            let fireStoreDatabase = Firestore.firestore()
            
            if let likeCount = Int(likeLabel.text!) {
                let likeStore = ["likes" : likeCount + 1] as [String : Any]
                fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
                
            }
            
            isLiked = true
            updateLikeButtonAppearance()
        } else {
            let fireStoreDatabase = Firestore.firestore()
            if let likeCount = Int(likeLabel.text!) {
                let likeStore = ["likes" : likeCount - 1] as [String : Any]
                fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
            }
            isLiked = false
            updateLikeButtonAppearance()
        }
        
        
        
    }
    
    func updateLikeButtonAppearance() {
        if isLiked {
            heartButton.setImage(UIImage(named: "filledHeart"), for: .normal)
        } else {
            heartButton.setImage(UIImage(named: "emptyHeart"), for: .normal)
        }
    }
    
    
    
    
    
    
  
    
    
    
    
    
    
}
/*@IBAction func heartButtonTapped(_ sender: UIButton) {
 // Düğmenin mevcut görüntüsünü kontrol edin
 if let currentImage = sender.image(for: .normal),
    let emptyHeartImage = UIImage(named: "emptyHeart"),
    let filledHeartImage = UIImage(named: "filledHeart") {
     if currentImage == emptyHeartImage {
         // Görüntüyü dolu kalbe değiştirin
         sender.setImage(filledHeartImage, for: .normal)
     } else {
         // Görüntüyü tekrar boş kalbe değiştirin
         sender.setImage(emptyHeartImage, for: .normal)
     }
 }

updateLikeButtonAppearance()



}*/

 
 
 
