//
//  NSOperationViewController.m
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "NSOperationViewController.h"

@interface NSOperationViewController ()


@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInvocationOperation * invocationOperationOne = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doBuy) object:nil];
    NSInvocationOperation * invocationOperationTwo = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doBuy) object:nil];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [queue addOperation:invocationOperationOne];
    [queue addOperation:invocationOperationTwo];
}


-(void)doBuy
{
    BOOL keepBuy;
    
    do{
        
        NSUInteger number = arc4random()%4+1;
        
        keepBuy = [self saleTicket:number];
        
    }while(keepBuy);
}



@end
