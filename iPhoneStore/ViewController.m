//
//  ViewController.m
//  iPhoneStore
//
//  Created by 盼头 on 16/9/13.
//  Copyright © 2016 盼头. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _up_thread = [[NSThread alloc] initWithTarget:self selector:@selector(update) object:nil];
    _res_path=[[NSBundle mainBundle]resourcePath]; // "...../Resources"
    _alarm_model=[self setting:0];
    [_Alarm setStringValue:_alarm_model];
    [_up_thread start];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

-(void)showInfo:(NSString*)model Status:(NSString *)status{
    @autoreleasepool {
        _green=[NSColor colorWithRed:75.0/255 green:200.0/255 blue:55.0/255 alpha:1];
        //_black=[NSColor colorWithRed:0 green:0 blue:0 alpha:1];
        _red=[NSColor colorWithRed:230.0/255 green:0 blue:0 alpha:1];
        if([status isEqual:@"ALL"]){
            if ([model containsString:_alarm_model]) {
                
                NSAlert *alt=[[NSAlert alloc]init];
                [alt setMessageText:@"有货啦！"];
                [alt setInformativeText:model];
                [alt addButtonWithTitle:@"确定"];
                [alt runModal];
                 
            }
            if ([[[self valueForKey:model] stringValue]isEqual:@"有货"])
                return;
            [[self valueForKey:model] setStringValue:@"有货"];
            [[self valueForKey:model] setTextColor:_green];
        }
        else{
            if ([[[self valueForKey:model] stringValue]isEqual:@"无货"])
                return;
            [[self valueForKey:model] setStringValue:@"无货"];
            [[self valueForKey:model] setTextColor:_red];
        }
    }
}


-(void)update{
    while(true){
        @autoreleasepool {
            NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:@"/tmp/data.out"];
            NSString *data=[[NSString alloc]initWithData:[file readDataToEndOfFile] encoding:NSUTF8StringEncoding];
            [file closeFile];
            file=nil;
            NSArray *arr_data=[data componentsSeparatedByString:@"\n"];
            data=nil;
            for(int i=0;i<[arr_data count];i++){
                if ([arr_data[i] isEqual:@"emptyall"])
                    break;
                NSArray *arr=[arr_data[i] componentsSeparatedByString:@":"];
                if ([arr[0] isEqual:@""])
                    continue;
                [self showInfo:arr[0] Status:arr[1]];
                arr=nil;
            }
            arr_data=nil;
            sleep(1);
        }
    }
}

-(NSString*)setting:(int)option{ //0.读设置模式 1.写设置模式
    const char *set_path=[[_res_path stringByAppendingString:@"/alarm.in"] UTF8String];
    char c_info[12];
    FILE *file=fopen(set_path, "r");
    fscanf(file,"%s",c_info);
    fclose(file);
    NSString *data=[NSString stringWithUTF8String:c_info];
    if(option==0){
        if([data isEqual:@""])
            return @"none";
        else
            return data;
    }
    else{
        file=fopen(set_path,"w");
        _alarm_model=[_Alarm stringValue];
        fprintf(file, "%s",[_alarm_model UTF8String]);
        fclose(file);
        return @"";
    }
}

- (IBAction)upp:(id)sender {
    [self setting:1];
}
@end
