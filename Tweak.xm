
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface SBIconView : UIView
@property(strong, nonatomic) id folderIcon;
@end

@interface SBFolderIconView : SBIconView
@end

%hook SBIconView

-(void) _createAccessoryViewIfNecessary{
	
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0")){
		if (![self folderIcon]){
			%orig;
		}
	} else{
		if (![self isKindOfClass:[%c(SBFolderIconView) class]]){
			%orig;
		}
	}
}

%end