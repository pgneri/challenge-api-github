//
//  AlertView.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertView : NSObject

/*!
 * Methods to show alertView
 */
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)showAlertWithMessage:(NSString *)message;


@end
