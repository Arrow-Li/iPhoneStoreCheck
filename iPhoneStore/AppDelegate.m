//
//  AppDelegate.m
//  iPhoneStore
//
//  Created by 盼头 on 16/9/13.
//  Copyright © 2016 盼头. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _r_path=[[NSBundle mainBundle]resourcePath];
    _t = [[NSThread alloc] initWithTarget:self selector:@selector(getSatus) object:nil];
    [_t start];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    //[NSThread exit];
    system("kill iPhoneStore");
}

-(void) getSatus{
    NSString *path=[_r_path stringByAppendingString:@"/iphone7.py"];
    path=[@"python " stringByAppendingString:path];
    while(true){
        system([path UTF8String]);
        sleep(1);
    }
}

@end
