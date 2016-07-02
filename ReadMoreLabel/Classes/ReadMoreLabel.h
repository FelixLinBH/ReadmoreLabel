//
//  ReadMoreLabel.h
//  Pods
//
//  Created by LBH on 2016/7/2.
//
//

#import <UIKit/UIKit.h>

@interface ReadMoreLabel : UILabel
@property (nonatomic,assign) BOOL isTrimEscapeCharacter;
-(void)appendTailString:(NSString *)tailString color:(UIColor *)color;
-(void)appendTailString:(NSString *)tailString color:(UIColor *)color font:(UIFont *)font;
@end
