//
//  ViewController.m
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , strong) NSLock * lock;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allTicketCount = 50;
    self.saleTicketCount = 0;
    self.leftTicketCount = self.allTicketCount-self.saleTicketCount;
    
}

-(BOOL)saleTicket:(NSUInteger)number
{
    [self.lock lock];
    
    NSLog(@"Thread:%@",[NSThread currentThread]);
    
    BOOL sale;
    
    NSLog(@"要买 %ld 张票",number);
    
    if (!self.leftTicketCount) {
        
        NSLog(@"没有票了，请勿继续购买！");
        
        [self.lock unlock];
        
        return sale;
    }
    
    if (self.leftTicketCount<number) {
        
        NSLog(@"票不足，可继续购买少量票");
        
        sale = YES;
        
        [self.lock unlock];

        return sale;
    }
    
    self.saleTicketCount += number;
    
    self.leftTicketCount -= number;
    
    sale = YES;
    
    NSLog(@"购买成功！");
    
    NSLog(@"剩余 %ld 张票！",self.leftTicketCount);
    
    [self.lock unlock];
    
    return sale;
}

-(NSLock *)lock
{
    if (!_lock) {
        _lock = [[NSLock alloc] init];
    }
    
    return _lock;
}

@end
