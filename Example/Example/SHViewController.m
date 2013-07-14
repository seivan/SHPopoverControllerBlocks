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
@interface SHViewController ()
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

  UIBarButtonItem * barButtonItem = self.navigationItem.rightBarButtonItem;
  [barButtonItem SH_addBlock:^(UIBarButtonItem *sender) {
    if(_popController.isPopoverVisible)
      [_popController dismissPopoverAnimated:YES];
    else
      [_popController presentPopoverFromBarButtonItem:barButtonItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
  }];
  
  
  
}


@end
