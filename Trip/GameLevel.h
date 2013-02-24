//
//  GameLevel.h
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TripTypes.h"

@interface GameLevel : NSObject
@property CGSize size;
- (id)initWithLevelNamed:(NSString *)levelName;
- (void)draw:(ViewPort)viewPort;
@end
