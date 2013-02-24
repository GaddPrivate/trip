//
//  GameLayer.m
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import "GameLayer.h"

@implementation GameLayer

- (void)onEnter {
    [super onEnter];
    
    self.state = [[GameState alloc] init];
    GameLevel *level = [[GameLevel alloc] initWithLevelNamed:@"level1.map"];
    self.state.level = level;
    
    [self schedule:@selector(update:)];
}

- (void)update:(ccTime)dt {
    _viewPort.cameraFrame = CGRectMake(0.0, 0.0, 480, 320);
    _viewPort.gameFrame = CGRectMake(0.0, 0.0, 480, 320);
}

- (void)draw {
    [self.state.level draw:self.viewPort];
}

@end
