//
//  ViewController.m
//  TouchKen
//
//  Created by Stronger Shen on 2015/1/30.
//  Copyright (c) 2015年 MobileIT. All rights reserved.
//

#import "ViewController.h"
#import "Ken.h"

@interface ViewController () <KenDelegate>
{
    NSInteger nTag;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    nTag = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    Ken *ken = [[Ken alloc] initWithPoint:point atDirection:1];
    ken.delegate = self;
    ken.tag = nTag;
    nTag++;
    [self.view addSubview:ken];
}

- (IBAction)RightAction:(id)sender {
    Ken *now = [self.view.subviews lastObject];
    [now GoRight];
//    NSLog(@"%@", self.view.subviews);
/*
    for (UIView *viewX in self.view.subviews) {
        if ([viewX isKindOfClass:[Ken class]]) {
            NSLog(@"%@", viewX);
        }
    }
 */
    
}
- (IBAction)LeftAction:(id)sender {
    Ken *now = [self.view.subviews lastObject];
    [now GoLeft];
}


-(void)Ken:(Ken *)ken didFinishedMovedWithStatus:(NSDictionary *)status
{
    NSLog(@"%@", status);
}
-(void)Ken:(Ken *)ken didTouchedKenTag:(long)tag{
    NSLog(@"You touch Ken id: %ld",(long)ken.tag);
}

@end













