//
//  GameLayer.h
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import "CCLayer.h"
#import "GameState.h"
#import "TripTypes.h"

@interface GameLayer : CCLayer
@property GameState *state;
@property ViewPort viewPort;
@end