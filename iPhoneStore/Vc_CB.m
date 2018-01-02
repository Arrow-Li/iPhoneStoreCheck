//
//  Vc_CB.m
//  iPhoneStore
//
//  Created by 盼头 on 16/9/13.
//  Copyright © 2016 盼头. All rights reserved.
//

#import "Vc_CB.h"

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    //_Causeway_Bay=[[NSThread alloc]initWithTarget:self selector:@selector(update) object:nil];
    //[_Causeway_Bay start];
}

-(void)showInfo:(NSString*)model Status:(NSString *)status{
    NSColor *green=[NSColor colorWithRed:75.0/255 green:200.0/255 blue:55.0/255 alpha:1];
    NSColor *black=[NSColor colorWithRed:0 green:0 blue:0 alpha:1];
    if([status isEqual:@"ALL"]){
        [[self valueForKey:model] setStringValue:@"有货"];
        [[self valueForKey:model] setTextColor:green];
    }
    else{
        [[self valueForKey:model] setStringValue:@"无货"];
        [[self valueForKey:model] setTextColor:black];
    }
}

-(void)update{
    while(1){
        NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:@"/Users/Jeep/Desktop/R409.out"];
        NSData *d=[file readDataToEndOfFile];
        NSString *data=[[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
        NSArray *arr_data=[data componentsSeparatedByString:@"\n"];
        for(int i=0;i<[arr_data count];i++){
            if ([arr_data[i] isEqual:@"emptyall"])
                break;
            NSArray *arr=[arr_data[i] componentsSeparatedByString:@":"];
            [self showInfo:arr[0] Status:arr[1]];
        }
        file=nil;
        sleep(1);
    }
}

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    //_Festivaal_Walk=[[NSThread alloc]initWithTarget:self selector:@selector(update) object:nil];
}

-(void)showInfo:(NSString*)model Status:(NSString *)status{
    NSColor *green=[NSColor colorWithRed:75.0/255 green:200.0/255 blue:55.0/255 alpha:1];
    NSColor *black=[NSColor colorWithRed:0 green:0 blue:0 alpha:1];
    if([status isEqual:@"ALL"]){
        [[self valueForKey:model] setStringValue:@"有货"];
        [[self valueForKey:model] setTextColor:green];
    }
    else{
        [[self valueForKey:model] setStringValue:@"无货"];
        [[self valueForKey:model] setTextColor:black];
    }
}

-(void)update{
    while(1){
        NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:@"/Users/Jeep/Desktop/R485.out"];
        NSData *d=[file readDataToEndOfFile];
        NSString *data=[[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
        NSArray *arr_data=[data componentsSeparatedByString:@"\n"];
        for(int i=0;i<[arr_data count];i++){
            if ([arr_data[i] isEqual:@"emptyall"])
                break;
            NSArray *arr=[arr_data[i] componentsSeparatedByString:@":"];
            [self showInfo:arr[0] Status:arr[1]];
        }
        file=nil;
        sleep(1);
    }
}

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    //_NewTwon_Plaza=[[NSThread alloc]initWithTarget:self selector:@selector(update) object:nil];
}

-(void)showInfo:(NSString*)model Status:(NSString *)status{
    NSColor *green=[NSColor colorWithRed:75.0/255 green:200.0/255 blue:55.0/255 alpha:1];
    NSColor *black=[NSColor colorWithRed:0 green:0 blue:0 alpha:1];
    if([status isEqual:@"ALL"]){
        [[self valueForKey:model] setStringValue:@"有货"];
        [[self valueForKey:model] setTextColor:green];
    }
    else{
        [[self valueForKey:model] setStringValue:@"无货"];
        [[self valueForKey:model] setTextColor:black];
    }
}

-(void)update{
    while(1){
        NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:@"/Users/Jeep/Desktop/R610.out"];
        NSData *d=[file readDataToEndOfFile];
        NSString *data=[[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
        NSArray *arr_data=[data componentsSeparatedByString:@"\n"];
        for(int i=0;i<[arr_data count];i++){
            if ([arr_data[i] isEqual:@"emptyall"])
                break;
            NSArray *arr=[arr_data[i] componentsSeparatedByString:@":"];
            [self showInfo:arr[0] Status:arr[1]];
        }
        file=nil;
        sleep(1);
    }
}

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    //_Canton_Road=[[NSThread alloc]initWithTarget:self selector:@selector(update) object:nil];
}

-(void)showInfo:(NSString*)model Status:(NSString *)status{
    NSColor *green=[NSColor colorWithRed:75.0/255 green:200.0/255 blue:55.0/255 alpha:1];
    NSColor *black=[NSColor colorWithRed:0 green:0 blue:0 alpha:1];
    if([status isEqual:@"ALL"]){
        [[self valueForKey:model] setStringValue:@"有货"];
        [[self valueForKey:model] setTextColor:green];
    }
    else{
        [[self valueForKey:model] setStringValue:@"无货"];
        [[self valueForKey:model] setTextColor:black];
    }
}

-(void)update{
    while(1){
        NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:@"/Users/Jeep/Desktop/R499.out"];
        NSData *d=[file readDataToEndOfFile];
        NSString *data=[[NSString alloc]initWithData:d encoding:NSUTF8StringEncoding];
        NSArray *arr_data=[data componentsSeparatedByString:@"\n"];
        for(int i=0;i<[arr_data count];i++){
            if ([arr_data[i] isEqual:@"emptyall"])
                break;
            NSArray *arr=[arr_data[i] componentsSeparatedByString:@":"];
            [self showInfo:arr[0] Status:arr[1]];
        }
        file=nil;
        sleep(1);
    }
}

@end