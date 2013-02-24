//
//  CocosManager.m
//  Trip
//
//  Created by Fredrik Gadnell on 2/24/13.
//
//

#import "CocosManager.h"

@implementation CocosManager

+ (CocosManager *)shared
{
    static dispatch_once_t once;
    static CocosManager *shared;
    dispatch_once(&once, ^ {shared = [[CocosManager alloc] init]; });
    return shared;
}

+ (CCDirectorIOS *)director
{
    return [[CocosManager shared] director];
}

- (void)setupWithFrame:(CGRect)frame
{
    self.director = (CCDirectorIOS*)[CCDirector sharedDirector];
    
	self.director.wantsFullScreenLayout = YES;
    
    
	// Display FSP and SPF
	[self.director setDisplayStats:YES];
    
	// set FPS at 60
	[self.director setAnimationInterval:1.0/60];
    
    CCGLView *view = [self ccViewWithFrame:frame];
	[self.director setView:view];
    
	// for rotation and other messages
	[self.director setDelegate:self];
    
	// 2D projection
	[self.director setProjection:kCCDirectorProjection2D];
    //	[director setProjection:kCCDirectorProjection3D];
    
	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if( ! [self.director enableRetinaDisplay:YES] )
		CCLOG(@"Retina Display Not supported");
    
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"
    
	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
}

- (CCGLView *)ccViewWithFrame:(CGRect)bounds
{
    CCGLView *glView = [CCGLView viewWithFrame:bounds
								   pixelFormat:kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
								   depthFormat:0	//GL_DEPTH_COMPONENT24_OES
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
    return glView;
}

#pragma mark - CCDirector delegate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
