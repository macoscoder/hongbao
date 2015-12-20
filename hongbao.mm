#line 1 "/Users/chenfei/mywork/hongbao/hongbao/hongbao.xm"




#import <UIKit/UIKit.h>




#include <logos/logos.h>
#include <substrate.h>
@class BaseMsgContentViewController; @class WCRedEnvelopesRedEnvelopesDetailViewController; @class WCPayC2CMessageNodeView; @class WCRedEnvelopesReceiveHomeView; 
static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$)(BaseMsgContentViewController*, SEL, unsigned int, id, unsigned int); static void _logos_method$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$(BaseMsgContentViewController*, SEL, unsigned int, id, unsigned int); static void _logos_method$_ungrouped$BaseMsgContentViewController$autoClick(BaseMsgContentViewController*, SEL); static void (*_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$)(WCRedEnvelopesReceiveHomeView*, SEL, id); static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$(WCRedEnvelopesReceiveHomeView*, SEL, id); static void (*_logos_orig$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$)(WCRedEnvelopesRedEnvelopesDetailViewController*, SEL, BOOL); static void _logos_method$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$(WCRedEnvelopesRedEnvelopesDetailViewController*, SEL, BOOL); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$WCPayC2CMessageNodeView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCPayC2CMessageNodeView"); } return _klass; }
#line 10 "/Users/chenfei/mywork/hongbao/hongbao/hongbao.xm"






static void _logos_method$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$(BaseMsgContentViewController* self, SEL _cmd, unsigned int arg1, id arg2, unsigned int arg3) {
	_logos_orig$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$(self, _cmd, arg1, arg2, arg3);

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self performSelector:@selector(autoClick)];
	});
}



static void _logos_method$_ungrouped$BaseMsgContentViewController$autoClick(BaseMsgContentViewController* self, SEL _cmd) {
	UITableView *tableView = [self valueForKey:@"m_tableView"];
	NSArray *cells = [tableView visibleCells];

	


	for (UITableViewCell *cell in cells) {
		for (UIView *view in cell.contentView.subviews) {
			if ([view isKindOfClass:_logos_static_class_lookup$WCPayC2CMessageNodeView()]) {
				WCPayC2CMessageNodeView *v = (WCPayC2CMessageNodeView *)view;
				_Bool last = [self isLastMsg:[v m_msgWrap]];
				if (last) {
					[v performSelector:@selector(onClick)];		
				}
				break;
			}
		}
	}
}









static void _logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$(WCRedEnvelopesReceiveHomeView* self, SEL _cmd, id arg1) {
	_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$(self, _cmd, arg1);

	[self performSelector:@selector(OnOpenRedEnvelopes)];	
	[self performSelector:@selector(OnCancelButtonDone)];
}









static void _logos_method$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$(WCRedEnvelopesRedEnvelopesDetailViewController* self, SEL _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$(self, _cmd, arg1);

	[self OnLeftBarButtonDone];		
}






static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BaseMsgContentViewController = objc_getClass("BaseMsgContentViewController"); MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(MessageReturn:MessageInfo:Event:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$MessageReturn$MessageInfo$Event$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(autoClick), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$autoClick, _typeEncoding); }Class _logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView = objc_getClass("WCRedEnvelopesReceiveHomeView"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesReceiveHomeView, @selector(refreshViewWithData:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesReceiveHomeView$refreshViewWithData$);Class _logos_class$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController = objc_getClass("WCRedEnvelopesRedEnvelopesDetailViewController"); MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesRedEnvelopesDetailViewController$viewWillAppear$);} }
#line 81 "/Users/chenfei/mywork/hongbao/hongbao/hongbao.xm"
