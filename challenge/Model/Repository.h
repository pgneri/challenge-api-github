//
//  Repository.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repository : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *descriptionRepo;
@property (nonatomic, strong) NSString *fork;
@property (nonatomic, strong) NSString *forks;
@property (nonatomic, strong) NSDictionary *owner;
@property (nonatomic, strong) NSString *ownerLogin;
@property (nonatomic, strong) NSString *ownerAvatar;
@property (nonatomic, strong) NSString *stargazers;

/*!
 * init method for repository
 */
- (Repository *)initWithDictionary:(NSDictionary *)dic;

@end
