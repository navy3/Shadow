
#import "GradientView.h"
#import <QuartzCore/QuartzCore.h>


@implementation GradientView

+ (Class)layerClass {
	return [CAGradientLayer class];
}

- (void)setupGradientLayer
{
	CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
	gradientLayer.colors =
		[NSArray arrayWithObjects:
			(id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor,
			(id)[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor,
		nil];
	self.backgroundColor = [UIColor clearColor];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
	if (self){
		CAGradientLayer *gradientLayer = (CAGradientLayer *)self.layer;
		gradientLayer.colors =
            [NSArray arrayWithObjects:
				(id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor,
				(id)[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor,
			nil];
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
