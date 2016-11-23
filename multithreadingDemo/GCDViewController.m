//
//  GCDViewController.m
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queueOne = dispatch_queue_create("queue.one", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queueTwo = dispatch_queue_create("queue.two", DISPATCH_QUEUE_CONCURRENT);
    
    __block GCDViewController * weakself = self;

    dispatch_group_async(group, queueOne, ^{
        
        BOOL keepBuy;
        
        do{
            
            NSUInteger number = arc4random()%4+1;
            
            keepBuy = [weakself saleTicket:number];
            
        }while(keepBuy);
        
    });
    
    dispatch_group_async(group, queueTwo, ^{
        
        BOOL keepBuy;
        
        do{
            
            NSUInteger number = arc4random()%4+1;
            
            keepBuy = [weakself saleTicket:number];
            
        }while(keepBuy);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"Finish");
    });
    
    NSLog(@"Main thread : %@",[NSThread currentThread]);

}

@end
