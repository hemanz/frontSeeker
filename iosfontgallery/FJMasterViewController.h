//
//  MPDMasterViewController.h
//  iosfontgallery
//
//  Created by FJ张鹤楠 on 15/9/8.
//  Copyright (c) 2015年 HIPPO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJDetailViewController;

@interface FJMasterViewController : UITableViewController

@property (strong, nonatomic) FJDetailViewController *detailViewController;

@end
