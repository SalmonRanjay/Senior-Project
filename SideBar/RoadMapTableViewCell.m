//
//  RoadMapTableViewCell.m
//  SideBar
//
//  Created by Ranjay Salmon on 3/23/15.
//  Copyright (c) 2015 Ranjay Salmon. All rights reserved.
//

#import "RoadMapTableViewCell.h"

@interface RoadMapTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellDescription;

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@property (weak, nonatomic) IBOutlet UILabel *cellDate;



@end

@implementation RoadMapTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) configureTableCellEntry:(NSString *)fieldOne : (NSString *) fieldTwo : (NSString *) fieldThree : (NSString *) fieldFour{
    
    self.cellTitle.text = fieldOne;
    self.cellDescription.text = fieldTwo;
    self.cellImage.image = [UIImage imageNamed:fieldThree];
    self.cellDate.text = fieldFour;
    
}


@end
