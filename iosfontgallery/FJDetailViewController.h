//
//  MPDDetailViewController.h
//  iosfontgallery
//
//  Created by FJ张鹤楠 on 15/9/8.
//  Copyright (c) 2015年 HIPPO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJDetailViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSString * fontFamilyName;
@property (strong, nonatomic) NSArray * fontNames;
@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;

- (IBAction)sizeSliderValueChanged:(UISlider *)sender;
@end
