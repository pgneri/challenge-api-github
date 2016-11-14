//
//  UserTableViewCell.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserTableViewCell : UITableViewCell
/*!
 * init method for user tableCell
 */
- (void)setupWitUser:(User *)user;


@end
