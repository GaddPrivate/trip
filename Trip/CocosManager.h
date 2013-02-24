//
//  CocosManager.h
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CocosManager : NSObject<CCDirectorDelegate>
@property CCDirectorIOS *director;
+ (CocosManager *)shared;
+ (CCDirectorIOS *)director;
- (void)setupWithFrame:(CGRect)frame;
@end
