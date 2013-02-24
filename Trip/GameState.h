//
//  GameState.h
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import <Foundation/Foundation.h>
#import "GameLevel.h"

@interface GameState : NSObject
@property GameLevel *level;
@property NSMutableArray *sprites;
@end
