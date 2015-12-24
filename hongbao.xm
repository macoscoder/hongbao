
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

/*
 * Hook 群类
 */
%hook BaseMsgContentViewController

/*
 * 来消息了
 */
- (void)MessageReturn:(unsigned int)arg1 MessageInfo:(id)arg2 Event:(unsigned int)arg3
{
	%orig;

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self performSelector:@selector(autoClick)];
	});
}

%new
- (void)autoClick
{
	UITableView *tableView = [self valueForKey:@"m_tableView"];
	NSArray *cells = [tableView visibleCells];

	/*
	 * 查找红包cell，只考虑最后一条消息
	 */
	for (UITableViewCell *cell in cells) {
		for (UIView *view in cell.contentView.subviews) {
			if ([view isKindOfClass:%c(WCPayC2CMessageNodeView)]) {
				WCPayC2CMessageNodeView *v = (WCPayC2CMessageNodeView *)view;
				_Bool last = [self isLastMsg:[v m_msgWrap]];
				if (last) {
					[v performSelector:@selector(onClick)];		// 模拟点击的操作
				}
				break;
			}
		}
	}
}

%end

/*
 * Hook 红包框类
 */
%hook WCRedEnvelopesReceiveHomeView

- (void)refreshViewWithData:(id)arg1
{
	%orig;

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self performSelector:@selector(OnOpenRedEnvelopes)];	// 拆红包
		[self performSelector:@selector(OnCancelButtonDone)];
	});

}

%end

/*
 * Hook 红包详情类
 */
%hook WCRedEnvelopesRedEnvelopesDetailViewController

- (void)viewWillAppear:(BOOL)arg1
{
	%orig;

	[self OnLeftBarButtonDone];		// 退出详情
}

%end

%hook JailBreakHelper

- (_Bool)IsJailBreak
{
	return NO;
}

%end

%hook MMUploadDataViewController

- (_Bool)isJailbreak
{
	return NO;
}

%end

%hook MMUploadFileViewController

- (_Bool)isJailbreak
{
	return NO;
}

%end
