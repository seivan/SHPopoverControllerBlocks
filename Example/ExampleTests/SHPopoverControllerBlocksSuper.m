//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//



#import "SHPopoverControllerBlocksSuper.h"



@implementation SHPopoverControllerBlocksSuper

-(void)setUp; {
  [super setUp];
  self.vc = UIViewController.new;
  
  UIViewController * popVc = UIViewController.new;
  popVc.view.frame = CGRectMake(0, 0, 200, 200);
  self.popoverController     = [[UIPopoverController alloc]
                                initWithContentViewController:popVc];
  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
  [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, 200, 200) inView:self.vc.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:NO];
  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
}
@end

