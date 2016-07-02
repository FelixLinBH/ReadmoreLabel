//
//  ReadmoreViewController.m
//  ReadMoreLabel
//
//  Created by felix.lin on 07/02/2016.
//  Copyright (c) 2016 felix.lin. All rights reserved.
//

#import "ReadmoreViewController.h"
#import <ReadMoreLabel/ReadMoreLabel.h>
@interface ReadmoreViewController ()

@end

@implementation ReadmoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ReadMoreLabel *label = [[ReadMoreLabel alloc]initWithFrame:CGRectMake(10, 50, 300, 300)];
    label.text = @"This is text. This is \r\ntext. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text. This is text.";
    label.numberOfLines = 4;
    label.font = [UIFont systemFontOfSize:16.0];
    label.isTrimEscapeCharacter = YES;
    [label appendTailString:@"..." color:[UIColor blueColor]];
    [label appendTailString:@"Read" color:[UIColor redColor]];
    [label appendTailString:@"More" color:[UIColor greenColor] font:[UIFont systemFontOfSize:18.0]];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
