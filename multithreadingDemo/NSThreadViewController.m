//
//  NSThreadViewController.m
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@property (nonatomic , strong) UIImageView * imgView;

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block NSThreadViewController * weakself = self;
    NSThread * threadOne = [[NSThread alloc] initWithBlock:^{
        
        BOOL keepBuy;
        
        do{
            
            NSUInteger number = arc4random()%4+1;
            
            keepBuy = [weakself saleTicket:number];
            
        }while(keepBuy);
        
    }];
    
    threadOne.threadPriority = 1.0;
    threadOne.name = @"ThreadOne";
    [threadOne start];
    
    NSThread * threadTwo = [[NSThread alloc] initWithBlock:^{
        
        BOOL keepBuy;
        
        do{
            NSUInteger number = arc4random()%4+1;
            
            keepBuy = [weakself saleTicket:number];
            
        }while(keepBuy);
        
    }];
    
    threadTwo.threadPriority = 1.0;
    threadTwo.name = @"ThreadTwo";
    [threadTwo start];
    
    
    NSLog(@"Main");    
}



@end
