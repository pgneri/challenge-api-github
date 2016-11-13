//
//  RepositoryTableViewCell.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "RepositoryTableViewCell.h"

@interface RepositoryTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property Repository* repository;

@end

@implementation RepositoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWitRepository:(Repository *)repository {
    _lblTitle.text = repository.name;
    self.repository = repository;
}

@end
