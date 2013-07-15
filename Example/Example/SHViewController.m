//
//  SHViewController.m
//  Example
//
//  Created by Seivan Heidari on 5/14/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//



#import "SHViewController.h"
#import "SHSecondViewController.h"
#import "SHPopoverControllerBlocks.h"
#import "SHBarButtonItemBlocks.h"
#import "SHControlBlocks.h"

@interface SHViewController ()
<UIPopoverControllerDelegate>

@property(nonatomic,strong) UIPopoverController * popController;

@end

@implementation SHViewController

-(void)viewDidLoad; {
  [super viewDidLoad];
  
}

-(void)viewDidAppear:(BOOL)animated; {
  [super viewDidAppear:animated];
  SHSecondViewController * secondVc = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
  self.popController = [[UIPopoverController alloc] initWithContentViewController:secondVc];
  self.popController.popoverContentSize = CGSizeMake(300, 300);

  UIBarButtonItem * barButtonItem = self.navigationItem.rightBarButtonItem;
  [barButtonItem SH_addBlock:^(UIBarButtonItem *sender) {
    if(_popController.isPopoverVisible)
      [_popController dismissPopoverAnimated:YES];
    else
      [_popController presentPopoverFromBarButtonItem:barButtonItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
  }];

  __block BOOL testShouldDismiss = NO;
  __block BOOL testDidDismiss    = NO;

  
  dispatch_semaphore_t semaphoreShouldDismiss = dispatch_semaphore_create(0);
  dispatch_semaphore_t semaphoreDidDismiss    = dispatch_semaphore_create(0);
  
  [self.popController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
    testShouldDismiss = YES;
    dispatch_semaphore_signal(semaphoreShouldDismiss);
    return YES;
  }];
  
  [self.popController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {
    testDidDismiss = YES;
    dispatch_semaphore_signal(semaphoreDidDismiss);
  }];
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    dispatch_semaphore_wait(semaphoreShouldDismiss, DISPATCH_TIME_FOREVER);
    SHBlockAssert(testShouldDismiss, @"testShouldDismiss should be YES");
    
    dispatch_semaphore_wait(semaphoreDidDismiss, DISPATCH_TIME_FOREVER);
    SHBlockAssert(testDidDismiss, @"testDidDismiss should be YES");
    
    self.popController = nil;
  });
  
  
}




@end
