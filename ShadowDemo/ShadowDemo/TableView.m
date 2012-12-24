
#import "TableView.h"

const CGFloat kShadowHeight = 20.0;

@interface TableView()
// originShadow is fixed at the top of the tableView, as it it was part of the background
@property (nonatomic, strong) CAGradientLayer *originShadow;

@property (nonatomic, strong) CAGradientLayer *topShadow;
@property (nonatomic, strong) CAGradientLayer *bottomShadow;

@end

@implementation TableView
@synthesize originShadow=_originShadow;


- (CAGradientLayer*) darkToLightShadow
{
    // 20px at the top
	CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
	CGRect newShadowFrame = CGRectMake(0, 0, self.frame.size.width, kShadowHeight);
	newShadow.frame = newShadowFrame;
    
    // Gradient with colors ranging from alpha=0.5 black to alpha=0.0 background color.
    UIColor *dark = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    UIColor *light = [self.backgroundColor colorWithAlphaComponent:0.0];
	newShadow.colors = [NSArray arrayWithObjects: CFBridgingRelease(dark.CGColor), light.CGColor, nil];
    
	return newShadow;
}


- (CAGradientLayer*) lightToDarkShadow
{
    // 20px at the top
	CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
	CGRect newShadowFrame = CGRectMake(0, 0, self.frame.size.width, 20.0);
	newShadow.frame = newShadowFrame;
    
    // Gradient with colors ranging from alpha=0.5 black to alpha=0.0 background color.
    UIColor *dark = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    UIColor *light = [self.backgroundColor colorWithAlphaComponent:0.0];
	newShadow.colors = [NSArray arrayWithObjects: CFBridgingRelease(light.CGColor), dark.CGColor, nil];
    
	return newShadow;
}


-(void) insertOriginShadow
{
    // layoutSubviews is called for every layout update, but we create and insert just once
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        self.originShadow = [self darkToLightShadow];
    });
    
    // always keep the shadow layer as layer 0, so others don't appear on top
    if (![[self.layer.sublayers objectAtIndex:0] isEqual:self.originShadow]) {
		[self.layer insertSublayer:self.originShadow atIndex:0];
	}
    
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    
    // counter the offset of the table view
    CGRect originShadowFrame = self.originShadow.frame;
    originShadowFrame.origin.y = self.contentOffset.y;
    self.originShadow.frame = originShadowFrame;
    
    // The offset grows positive when you drag the table view up, if you set
    // the origin.y to the offset, the shadow moves down as the view goes up.
    // The end effect is that it remains in place. Same thing when dragging down.
    
    // This all happens on a transaction that disables implicit animation while
    // we change the position. Otherwise it would show all over the place.
    
    [CATransaction commit];
}


-(void) insertTopShadow {
    
    bool tableHasVisibleRows = [[self indexPathsForVisibleRows] count]>0;
    
    // if there are no rows and top shadow has a parent, remove it from the parent
	if (!tableHasVisibleRows) {
        if (self.topShadow.superlayer){
		    [self.topShadow removeFromSuperlayer];
        }
		return;
	}
    
    // check if the first visible row is also the first row of the table
    NSIndexPath *firstVisibleRow = [self.indexPathsForVisibleRows objectAtIndex:0];
    bool isFirstTableRow = [firstVisibleRow section]==0 && [firstVisibleRow row]==0;
	if (isFirstTableRow) {
        
        UIView *cell = [self cellForRowAtIndexPath:firstVisibleRow];
        
        // in case there is a header view
        if (self.tableHeaderView){
            cell = self.tableHeaderView;
        }
        
        // build the shadow
        static dispatch_once_t once;
        dispatch_once(&once, ^ {
            self.topShadow = [self lightToDarkShadow];
            CGRect shadowFrame = self.topShadow.frame;
            shadowFrame.size.width = cell.frame.size.width;
            shadowFrame.origin.y = -20;
            self.topShadow.frame = shadowFrame;
        });
        
        // if layer at index 0 is not the shadow, move the shadow to index 0
		if ([cell.layer.sublayers indexOfObjectIdenticalTo:self.topShadow] != 0){
            [cell.layer insertSublayer:self.topShadow atIndex:0];
        }
        
    } else {
        
        // this prevents the shadow from showing up on reused cells
        if (self.topShadow.superlayer){
		    [self.topShadow removeFromSuperlayer];
        }
    }
}


-(void) insertBottomShadow {
    
    bool tableHasVisibleRows = [[self indexPathsForVisibleRows] count]>0;
    
    // if there are no rows and top shadow has a parent, remove it from the parent
	if (!tableHasVisibleRows) {
        if (self.bottomShadow.superlayer){
		    [self.bottomShadow removeFromSuperlayer];
        }
		return;
	}
    
    // check if the first visible row is also the first row of the table
    NSIndexPath *lastVisibleRow = [self.indexPathsForVisibleRows lastObject];
    NSInteger lastSectionNumber = [self numberOfSections]-1;
    NSInteger lastRowNumber = [self numberOfRowsInSection:[lastVisibleRow section]]-1;
    bool isLastTableRow = [lastVisibleRow section]==lastSectionNumber && [lastVisibleRow row]==lastRowNumber;
	if (isLastTableRow) {
        
        UIView *cell = [self cellForRowAtIndexPath:lastVisibleRow];
        
        // build the shadow
        static dispatch_once_t once;
        dispatch_once(&once, ^ {
            self.bottomShadow = [self darkToLightShadow];
            CGRect shadowFrame = self.bottomShadow.frame;
            shadowFrame.size.width = cell.frame.size.width;
            shadowFrame.origin.y = cell.frame.size.height;
            self.bottomShadow.frame = shadowFrame;
        });
        
        // if layer at index 0 is not the shadow, move the shadow to index 0
		if ([cell.layer.sublayers indexOfObjectIdenticalTo:self.bottomShadow] != 0){
            [cell.layer insertSublayer:self.bottomShadow atIndex:0];
        }
        
    } else {
        
        // this prevents the shadow from showing up on reused cells
        if (self.bottomShadow.superlayer){
		    [self.bottomShadow removeFromSuperlayer];
        }
    }
}


- (void)layoutSubviews
{
	[super layoutSubviews];
    [self insertOriginShadow];
    [self insertTopShadow];
    [self insertBottomShadow];
}


@end
