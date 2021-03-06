//
//  UserTableViewCell.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "UserTableViewCell.h"

@interface UserTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *ImgAvatar;

@property User* user;

@end

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWitUser:(User *)user {
    _lblName.text = user.name;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSURL *url = [NSURL URLWithString:user.avatar];
        NSData *dataImage = [NSData dataWithContentsOfURL:url];

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            _ImgAvatar.image = [UIImage imageWithData:dataImage];
        });
    });
    self.user = user;
}

@end
