//
//  GameLevel.m
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import "GameLevel.h"

@implementation GameLevel

- (id)initWithLevelNamed:(NSString *)levelName
{
    self = [super init];
    if (self) {
        _size = CGSizeMake(1400, 600);
    }
    return self;
}

- (void)draw:(ViewPort)viewPort
{
    ccColor4F color = ccc4f(0.8, 0.85, 1.0, 1.0);
    ccDrawSolidRect(viewPort.cameraFrame.origin, CGPointMake(viewPort.cameraFrame.size.width, viewPort.cameraFrame.size.height), color);
}

@end
