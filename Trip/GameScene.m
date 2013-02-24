//
//  GameScene.m
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import "GameScene.h"

@implementation GameScene

- (id)init {
    
    if ((self = [super init])) {
        self.layer = [[GameLayer alloc] init];
        [self addChild:_layer];
    }
    return self;
}

@end
