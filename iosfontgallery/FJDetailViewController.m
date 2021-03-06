//
//  MPDDetailViewController.m
//  iosfontgallery
//
//  Created by FJ张鹤楠 on 15/9/8.
//  Copyright (c) 2015年 HIPPO. All rights reserved.
//

#import "FJDetailViewController.h"

#define MPD_MIN_FONT_SIZE   12.0
#define MPD_MAX_FONT_SIZE   48.0

@interface FJDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation FJDetailViewController

#pragma mark - Managing the detail item

- (void)setFontFamilyName:(NSString*)newDetailItem
{
    if (_fontFamilyName != newDetailItem) {
        _fontFamilyName = newDetailItem;
        
        _fontNames =[UIFont fontNamesForFamilyName:_fontFamilyName];
        
        self.title = newDetailItem;
        [self.tableView reloadData];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark Table View

- (CGFloat) currentFontSize
{
    return MPD_MIN_FONT_SIZE + _fontSizeSlider.value * (MPD_MAX_FONT_SIZE - MPD_MIN_FONT_SIZE);
}

- (IBAction)sizeSliderValueChanged:(UISlider *)sender {
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0]
                  withRowAnimation:UITableViewRowAnimationNone];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fontNames count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FontCell"];
    
    NSString * fontName = _fontNames[indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:fontName size:[self currentFontSize]];
    cell.textLabel.text = [NSString stringWithFormat:@"字体：%@,拖动按钮可以调整大小",fontName] ;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MPD_MAX_FONT_SIZE*1.5;
}



@end
