//
//  ReadMoreLabel.m
//  Pods
//
//  Created by LBH on 2016/7/2.
//
//

#import "ReadMoreLabel.h"
#import <CoreText/CoreText.h>

@interface ReadMoreLabel()
@property NSMutableArray * wordToReplaceTails;
@end

@implementation ReadMoreLabel


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _wordToReplaceTails = [[NSMutableArray alloc]init];
        _isTrimEscapeCharacter = YES;
    }
    return self;
}

-(void)appendTailString:(NSString *)tailString color:(UIColor *)color font:(UIFont *)font{
    [_wordToReplaceTails addObject:@{@"tailString":tailString,@"color":color,@"font":font}];
}

-(void)appendTailString:(NSString *)tailString color:(UIColor *)color{
    [_wordToReplaceTails addObject:@{@"tailString":tailString,@"color":color}];
}

- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGAffineTransform flipVertical = CGAffineTransformMake(1,0,0,-1,0,self.bounds.size.height);
    CGContextConcatCTM(context, flipVertical);
    
    NSMutableAttributedString *attributedString;
    if (_isTrimEscapeCharacter) {
        NSString *newString = [[self.text componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:newString];
        
        [[attributedString mutableString] replaceOccurrencesOfString:@"\r\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, attributedString.string.length)];
    }else{
        attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    }
   
    
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)self.font.fontName, self.font.pointSize, NULL);
    [attributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontRef range:NSMakeRange(0, [attributedString length])];
    CFRelease(fontRef);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect bounds = CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)attributedString);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0, 0), path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    CFIndex lineCount = CFArrayGetCount(lines);
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:@""];
    for (NSDictionary *item in _wordToReplaceTails) {
        UIColor *color = item[@"color"];
        NSDictionary * attributes = @{NSForegroundColorAttributeName: color,(NSString*)kCTFontAttributeName : (item[@"font"])?item[@"font"]:self.font};
        NSAttributedString * subString = [[NSAttributedString alloc] initWithString:item[@"tailString"] attributes:attributes];
        [string appendAttributedString:subString];
        
    }

    NSAttributedString * tokenString = [[NSAttributedString alloc] initWithAttributedString:string];

    BOOL flagOverNumberLine = true;
    NSInteger numberOfLines = MIN(self.numberOfLines, lineCount);
    if (lineCount < self.numberOfLines) {
        flagOverNumberLine = false;
        [attributedString appendAttributedString:tokenString];
        CFRelease(ctFrame);
        ctFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0, 0), path, NULL);
        lines = CTFrameGetLines(ctFrame);
        
        lineCount = CFArrayGetCount(lines);
        numberOfLines = lineCount;
        
    }
    
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    for (int i = 0; i < numberOfLines; i++) {
        
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGFloat lineAscent;
        CGFloat lineDescent;
        CGFloat lineLeading;
        CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);
        CGContextSetTextPosition(context,  lineOrigins[i].x, lineOrigins[i].y);
        
        
        if (i == (numberOfLines-1)) {
            CFRange lastLineRange = CTLineGetStringRange(line);
            NSMutableAttributedString *truncationString = [[attributedString attributedSubstringFromRange:NSMakeRange(lastLineRange.location, lastLineRange.length)] mutableCopy];
            CTLineTruncationType truncationType = kCTLineTruncationEnd;
            CTLineRef truncationToken = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)tokenString);
            
            if (lastLineRange.length > 0) {
                // Remove any whitespace at the end of the line.
                unichar lastCharacter = [[truncationString string] characterAtIndex:lastLineRange.length - 1];
                
                if ([[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:lastCharacter]) {
                    [truncationString deleteCharactersInRange:NSMakeRange(lastLineRange.length - 1, 1)];
                }
            }
            
            [truncationString appendAttributedString:tokenString];
            CTLineRef truncationLine = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)truncationString);
            CTLineRef truncatedLine = CTLineCreateTruncatedLine(truncationLine, self.frame.size.width, truncationType, truncationToken);
            CTLineDraw(truncatedLine, context);
            CFRelease(truncatedLine);
            CFRelease(truncationLine);
            CFRelease(truncationToken);
        }else{
            CTLineDraw(line, context);
        }
    }
    CFRelease(framesetter);
    CFRelease(ctFrame);
}



@end
