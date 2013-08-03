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
  STAssertNil(self.popoverController.delegate, nil);
}

-(void)testSetDelegateSH_setDidDismissPopoverBlock; {
  self.popoverController.delegate = nil;
  [self testHasNoDelegateDefault];
  [self.popoverController SH_setDidDismissPopoverBlock:^(UIPopoverController *thePopoverController) {}];
  STAssertNotNil(self.popoverController.delegate, nil);
  
}

-(void)testSetDelegateSH_setShouldDismissPopoverBlock; {
  self.popoverController.delegate = nil;
  [self testHasNoDelegateDefault];
  [self.popoverController SH_setShouldDismissPopoverBlock:^BOOL(UIPopoverController *thePopoverController) {return YES;}];
  
  STAssertNotNil(self.popoverController.delegate, nil);
  
}


-(void)testHasNoSH_blockDidDismissPopoverBlock; {
  STAssertNil(self.popoverController.SH_blockDidDismissPopoverBlock, nil);
}

-(void)testHasNoSH_blockShouldDismissPopoverBlock; {
  STAssertNil(self.popoverController.SH_blockShouldDismissPopoverBlock, nil);
}

-(void)testSH_setShouldDismissPopoverBlock; {
SHPopverControllerShouldDismissBlock block = ^BOOL(UIPopoverController *
                                                   thePopoverController) {return YES;};
  
  [self.popoverController SH_setShouldDismissPopoverBlock:block];
  STAssertNotNil(block, nil);
  STAssertEqualObjects(self.popoverController.SH_blockShouldDismissPopoverBlock, block, nil);
  [self.popoverController SH_setShouldDismissPopoverBlock:nil];
  [self testHasNoSH_blockShouldDismissPopoverBlock];
  
}

-(void)testSH_setDidDismissPopoverBlock; {
  SHPopverControllerDidDismissBlock block = ^(UIPopoverController *
                                                     thePopoverController) {};
  
  [self.popoverController SH_setDidDismissPopoverBlock:block];
  STAssertNotNil(block, nil);
  STAssertEqualObjects(self.popoverController.SH_blockDidDismissPopoverBlock, block, nil);
  [self.popoverController SH_setDidDismissPopoverBlock:nil];
  [self testHasNoSH_blockDidDismissPopoverBlock];
}







@end
