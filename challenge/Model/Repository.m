//
//  Repository.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "Repository.h"

@implementation Repository

- (Repository *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _name = dic[@"name"];
        _fullName = dic[@"full_name"];
        _language = dic[@"language"];
        _descriptionRepo = dic[@"description"];
        _fork = dic[@"fork"];
        _forks = dic[@"forks"];
        _owner = dic[@"owner"];
        _ownerLogin = _owner[@"login"];
        _ownerAvatar = _owner[@"avatar_url"];
    }
    return self;
}


@end
