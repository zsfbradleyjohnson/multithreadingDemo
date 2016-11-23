//
//  ViewController.h
//  multithreadingDemo
//
//  Created by bradleyjohnson on 2016/11/22.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic , assign) NSInteger allTicketCount;

@property (nonatomic , assign) NSInteger saleTicketCount;

@property (nonatomic , assign) NSInteger leftTicketCount;

-(BOOL)saleTicket:(NSUInteger)number;

@end

