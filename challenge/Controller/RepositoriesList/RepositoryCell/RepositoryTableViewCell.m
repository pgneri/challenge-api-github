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
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblLanguage;

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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            @try {
               _lblLanguage.text = repository.language;
            }
            @catch (NSException *exception) {
               _lblLanguage.text = @"";
            }
            @try {
               _lblDescription.text = repository.descriptionRepo;
            }
            @catch (NSException *exception) {
               _lblDescription.text = @"";
            }
        });
    });
    self.repository = repository;
}

@end
