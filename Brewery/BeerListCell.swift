//
//  BeerListCell.swift
//  Brewery
//
//  Created by David Yoon on 2021/12/13.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    let beerImageView = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        [self.beerImageView, self.nameLabel, self.taglineLabel].forEach{
            self.contentView.addSubview($0)
            
        }
        
        self.beerImageView.contentMode = .scaleAspectFit
        
        self.nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        self.nameLabel.numberOfLines = 2
        
        self.taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        self.taglineLabel.textColor = .systemBlue
        self.taglineLabel.numberOfLines = 0
        
        
        self.beerImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        self.nameLabel.snp.makeConstraints{
            $0.leading.equalTo(self.beerImageView.snp.trailing).offset(10)
            $0.bottom.equalTo(self.beerImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        self.taglineLabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(self.nameLabel)
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(20)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        self.beerImageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "beer_icon"))
        self.nameLabel.text = beer.name ?? "이름 없는 맥주"
        self.taglineLabel.text = beer.tagLine
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
}

