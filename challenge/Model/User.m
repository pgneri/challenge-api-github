//
//  User.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _name = dic[@"login"];
        _avatar = dic[@"avatar_url"];
    }
    return self;
}


@end
