//
//  SHActionSheetBlocksCallbacksScenarion.m
//  Example
//
//  Created by Seivan Heidari on 7/31/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import "SHPopoverControllerBlocksSuper.h"


@interface SHPopoverControllerBlocksCallbacksIntegration : SHPopoverControllerBlocksSuper
@property(nonatomic,strong) UIViewController    * vc;
@property(nonatomic,strong) UIPopoverController * popoverController;


@end

@implementation SHPopoverControllerBlocksCallbacksIntegration
//-(void)beforeEach; {
//  [super beforeEach];
//  self.vc = UIViewController.new;
//  
//  UIViewController * popVc = UIViewController.new;
//  popVc.view.frame = CGRectMake(0, 0, 200, 200);
//  self.popoverController     = [[UIPopoverController alloc]
//                                initWithContentViewController:popVc];
//  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
//  [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, 200, 200) inView:self.vc.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:NO];
//  [UIApplication sharedApplication].keyWindow.rootViewController = self.vc;
//
//  
//}


-(void)testSH_blockShouldDismissPopoverBlockAsYes; {

  __block BOOL testShouldDismiss = NO;
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
      testShouldDismiss = YES;
      return YES;
    }];
    [tester tapScreenAtPoint:CGPointMake(250, 250)];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:5];
  XCTAssertTrue(testShouldDismiss);
  XCTAssertFalse(self.popoverController.isPopoverVisible);
}

-(void)testSH_blockShouldDismissPopoverBlockAsNo; {
  __block BOOL testShouldDismiss = NO;
  
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
      testShouldDismiss = YES;
      return NO;
    }];
    [tester tapScreenAtPoint:CGPointMake(250, 250)];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:5];
  XCTAssertTrue(testShouldDismiss);
  XCTAssertTrue(self.popoverController.isPopoverVisible);
}

-(void)testSH_blockDidDismissPopoverBlock; {
  __block BOOL testDidDismiss = NO;
  
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    [self.popoverController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {
      testDidDismiss = YES;
    }];
    [tester tapScreenAtPoint:CGPointMake(250, 250)];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:5];
  XCTAssertTrue(testDidDismiss);
  XCTAssertFalse(self.popoverController.isPopoverVisible);
}

-(void)testSH_blockBothCallBacksShouldNot; {
  
  __block BOOL testShouldDismiss = NO;
  __block BOOL testDidDismiss = NO;
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
      testShouldDismiss = YES;
      return NO;
    }];
    
    [self.popoverController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {
      testDidDismiss = YES;
    }];
    [tester tapScreenAtPoint:CGPointMake(250, 250)];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:5];
  XCTAssertTrue(testShouldDismiss);
  XCTAssertFalse(testDidDismiss);
  XCTAssertTrue(self.popoverController.isPopoverVisible);
}


-(void)testSH_blockBothCallBacksShould; {
  
  __block BOOL testShouldDismiss = NO;
  __block BOOL testDidDismiss = NO;
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
      testShouldDismiss = YES;
      return YES;
    }];
    
    [self.popoverController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {
      testDidDismiss = YES;
    }];
    [tester tapScreenAtPoint:CGPointMake(250, 250)];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:5];
  XCTAssertTrue(testShouldDismiss);
  XCTAssertTrue(testDidDismiss);
  XCTAssertFalse(self.popoverController.isPopoverVisible);
}




@end
