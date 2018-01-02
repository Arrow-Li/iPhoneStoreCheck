//
//  AppDelegate.h
//  iPhoneStore
//
//  Created by 盼头 on 16/9/13.
//  Copyright © 2016 盼头. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property NSThread* t;
@property NSString* r_path;
-(void)getSatus;
@end

