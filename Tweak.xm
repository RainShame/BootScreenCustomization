#define TWEAK
#import "../CC.h"
#import "./Prefs.h"
#import <objc/runtime.h>
#import <libkern/OSAtomic.h>

UIColor *appleColor = appleImageColor();

@interface PUIProgressWindow : NSObject
{
	CGImageRef _appleLogo;
	CALayer * _layer;
	CGSize _displaySize;
}
@property (nonatomic, readonly) CALayer *layer;
- (void)_collectDisplayInfo;
- (void)_createLayer;
- (void)_layoutScreen;
- (CGImageRef)_createImageWithName:(NSString *)string scale:(CGFloat)scale displayHeight:(CGFloat)height;
@end


%hook PUIProgressWindow

- (void)_createLayer
{
	%orig;
	UIColor *bgColor = backgroundImageColor();
	CALayer *layer = MSHookIvar<CALayer *>(self, "_layer");
	layer.backgroundColor = bgColor.CGColor;
}


- (CGImageRef)_createImageWithName:(NSString *)string scale:(CGFloat)scale displayHeight:(CGFloat)height
{
    return CGImageRetain([[UIImage imageWithCGImage:%orig] _flatImageWithColor:appleColor].CGImage);
}



%end


%ctor
{
	HaveObserver()
	callback();
	if (enabled) {
		%init;
	}
}