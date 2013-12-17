//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Seivan Heidari on 7/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


#import "SHPopoverControllerBlocksSuper.h"

@interface SHPopoverControllerBlocksSelectors : SHPopoverControllerBlocksSuper
@end



@implementation SHPopoverControllerBlocksSelectors

-(void)setUp; {
  [super setUp];    
}

-(void)tearDown; {
  [super tearDown];
}

-(void)testHasNoDelegateDefault; {
  XCTAssertNil(self.popoverController.delegate);
}

-(void)testSetDelegateSH_setDidDismissPopoverBlock; {
  self.popoverController.delegate = nil;
  [self testHasNoDelegateDefault];
  [self.popoverController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {}];
  XCTAssertNotNil(self.popoverController.delegate);
  
}

-(void)testSetDelegateSH_setShouldDismissPopoverBlock; {
  self.popoverController.delegate = nil;
  [self testHasNoDelegateDefault];
  [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {return YES;}];
  
  XCTAssertNotNil(self.popoverController.delegate);
  
}


-(void)testHasNoSH_blockDidDismissPopoverBlock; {
  XCTAssertNil(self.popoverController.SH_blockDidDismissPopoverBlock);
}

-(void)testHasNoSH_blockShouldDismissPopoverBlock; {
  XCTAssertNil(self.popoverController.SH_blockShouldDismissPopoverBlock);
}

-(void)testSH_setShouldDismissPopoverBlock; {
SHPopverControllerShouldDismissBlock block = ^BOOL(UIPopoverController *
                                                   thePopoverController) {return YES;};
  
  [self.popoverController SH_setShouldDismissPopoverBlock:block];
  XCTAssertNotNil(block);
  XCTAssertEqualObjects(self.popoverController.SH_blockShouldDismissPopoverBlock, block);
  [self.popoverController SH_setShouldDismissPopoverBlock:nil];
  [self testHasNoSH_blockShouldDismissPopoverBlock];
  
}

-(void)testSH_setDidDismissPopoverBlock; {
  SHPopverControllerDidDismissBlock block = ^(UIPopoverController *
                                                     thePopoverController) {};
  
  [self.popoverController SH_setDidDismissPopoverBlock:block];
  XCTAssertNotNil(block);
  XCTAssertEqualObjects(self.popoverController.SH_blockDidDismissPopoverBlock, block);
  [self.popoverController SH_setDidDismissPopoverBlock:nil];
  [self testHasNoSH_blockDidDismissPopoverBlock];
}







@end
