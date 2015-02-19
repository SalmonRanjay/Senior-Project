//
//  InformationSessionTableViewCell.m
//  SideBar
//
//  Created by Ranjay Salmon on 2/17/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import "InformationSessionTableViewCell.h"

@interface InformationSessionTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;

@property (weak, nonatomic) IBOutlet UILabel *cellDescription;

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;


@end

@implementation InformationSessionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureTableCellEntry:(NSString *)fieldOne : (NSString *) fieldTwo : (NSString *) fieldThree{
    
    self.cellTitle.text = fieldOne;
    self.cellDescription.text = fieldTwo;
    self.cellImage.image = [UIImage imageNamed:fieldThree];
    
}

@end
