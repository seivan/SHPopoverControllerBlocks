//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import "SHPopoverControllerBlocksSuper.h"
@interface SHPopoverControllerBlocksCallbacks : SHPopoverControllerBlocksSuper

@end




@implementation SHPopoverControllerBlocksCallbacks

-(void)setUp; {
  [super setUp];

  
  
}

-(void)tearDown; {
  [super tearDown];
}

-(void)testSH_blockDidDismissPopoverBlock; {
  __block UIPopoverController  * popvc = nil;
  [self.popoverController SH_setDidDismissPopoverBlock:^void(UIPopoverController *thePopoverController) {
    popvc = thePopoverController;
  }];
  
  self.popoverController.SH_blockDidDismissPopoverBlock(self.popoverController);
  XCTAssertEqualObjects(self.popoverController, popvc);

}

-(void)testSH_blockShouldDismissPopoverBlock; {
  __block UIPopoverController  * popvc = nil;
  [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {
    popvc = thePopoverController;
    return YES;
  }];
  
  self.popoverController.SH_blockShouldDismissPopoverBlock(self.popoverController);
  XCTAssertEqualObjects(self.popoverController, popvc);
  
  
}

@end
